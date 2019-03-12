# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python2-monero"
_projname="monero-python"
pkgver=0.5.1
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/monero-ecosystem/monero-python'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-pysha3')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('3bc4b82162a85ec6804d573ad41c6029')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
