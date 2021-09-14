# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-cardano"
_projname="cardano-python"
pkgver=0.7.2
pkgrel=1
pkgdesc='A comprehensive Python module for handling Cardano cryptocurrency and blockchain platform'
license=('BSD')
arch=('any')
url='https://github.com/emesik/cardano-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests')
source=("https://github.com/emesik/${_projname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a514ef6543f31d2099ec76fbfdb89fce0a381431f0618c577095457ff9c4dca7')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
