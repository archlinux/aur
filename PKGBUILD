# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python2-monero"
_projname="monero-python"
pkgver=0.4.4
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/emesik/monero-python'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-pysha3')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('6af6fa4fa2e3a80cb22c00f2b7e6c3e7')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
