# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=pip-tools
pkgver=3.1.0
pkgrel=1
pkgdesc="A set of tools to keep your pinned Python dependencies fresh."
arch=('any')
url="https://github.com/jazzband/pip-tools/"
license=('BSD')
depends=('python-click' 'python-pip' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('aa700526c25713f2d0d842f3ec316103')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
