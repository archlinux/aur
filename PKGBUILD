# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=pip-tools
pkgver=1.8.0
pkgrel=1
pkgdesc="A set of tools to keep your pinned Python dependencies fresh."
arch=('any')
url="https://github.com/nvie/pip-tools"
license=('BSD')
depends=('python-click' 'python-first' 'python-pip' 'python-six')
source=("https://pypi.python.org/packages/6b/e3/032350634958091ee804102753916459a8ea2616df23e7c88cce67127e39/${pkgname}-${pkgver}.tar.gz"
        LICENSE.txt)
md5sums=('d4bfe6407a7303ddc6e0d5397302b88e'
         'b542fe20de254615b3ab48020bc73441')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
