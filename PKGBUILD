# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=pip-tools
pkgver=3.3.1
pkgrel=1
pkgdesc="A set of tools to keep your pinned Python dependencies fresh."
arch=('any')
url="https://github.com/jazzband/pip-tools/"
license=('BSD')
depends=('python-click' 'python-pip' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7a11f52fa82586b8c2a7f7acbfdadb74')

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
