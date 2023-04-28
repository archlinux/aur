# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pyhdfe'
_pkgname=pyhdfe
pkgver=0.1.2
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
sha256sums=('a906e5d0922a65503333028e944d993ce15f4ee44e2b3ace2f79049623888432')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

check() {
  cd "$_pkgname-$pkgver"
  pytest pyhdfe/tests/
}
