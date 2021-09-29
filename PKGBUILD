# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-cardano"
_projname="cardano-python"
pkgver=0.7.3
pkgrel=1
pkgdesc='A comprehensive Python module for handling Cardano cryptocurrency and blockchain platform'
license=('BSD')
arch=('any')
url='https://github.com/emesik/cardano-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests')
source=("https://github.com/emesik/${_projname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89cd2a0a2126c6867af7223e3214d2de7ad33ae3185be84525a29c14c8ef54a9')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
