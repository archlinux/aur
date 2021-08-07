# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-cardano"
_projname="cardano-python"
pkgver=0.6.1
pkgrel=1
pkgdesc='A comprehensive Python module for handling Cardano cryptocurrency and blockchain platform'
license=('BSD')
arch=('any')
url='https://github.com/emesik/cardano-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('b2fcc10ea2f75ac0d140d17b88f7dd7532e9667b32d238a8307d11b8193a4e88')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
