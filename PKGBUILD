# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pyhdfe'
_pkgname=pyhdfe
pkgver=0.2.0
pkgrel=1
pkgdesc='Algorithms for high dimensional fixed effect absorption'
arch=('any')
url='https://github.com/jeffgortmaker/pyhdfe'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy')
checkdepends=('python-pytest')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8cddc5f5a09148d3281fca3c787146a85ecc5a7517be3ae5762bfe507907b7fb')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

check() {
  cd "$_pkgname-$pkgver"
  pytest pyhdfe/tests/
}
