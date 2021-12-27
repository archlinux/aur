# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-cardano"
_projname="cardano-python"
pkgver=0.8.1
pkgrel=1
pkgdesc='A comprehensive Python module for handling Cardano cryptocurrency and blockchain platform'
license=('BSD')
arch=('any')
url='https://github.com/emesik/cardano-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests')
source=("https://github.com/emesik/${_projname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('434dc69a067df900d8c15b758d188ffe8056d2f162382071b303c2eeffedeb57')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
