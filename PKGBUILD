pkgname=python-chaospy
pkgver=3.0.0
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-networkx' 'python-scikit-learn')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('9448d87ba7ffc3028e3c13e759bb6dd049f134a0d771e3d6ffd0e34c02e2d600')

build() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

