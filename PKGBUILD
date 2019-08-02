pkgname=python-chaospy
pkgver=3.0.6
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-scikit-learn')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('a3f81abf6446cce0116890c0188bd610d6302c52004adb90b32cf1578b7e7f7a')

build() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

