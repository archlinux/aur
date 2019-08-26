pkgname=python-chaospy
pkgver=3.0.9
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-scikit-learn')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('1bbaf2e34a15347e916ddb7563992196b15adee89d7010f0e9e01b6b07f20389')

build() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

