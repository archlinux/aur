# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-cardano"
_projname="cardano-python"
pkgver=0.8.2
pkgrel=1
pkgdesc='A comprehensive Python module for handling Cardano cryptocurrency and blockchain platform'
license=('BSD')
arch=('any')
url='https://github.com/emesik/cardano-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests')
source=("https://github.com/emesik/${_projname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3713777220632ac650e4cc6378e4a7e415dffba4d496f0c37b35000514ef19c1')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
