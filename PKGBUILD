# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python2-monero"
_projname="monero-python"
pkgver=0.99
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/monero-ecosystem/monero-python'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-pycryptodomex' 'python2-six' 'python2-ipaddress'
        'python2-varint' 'python2-pynacl')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('6dea9b53f0d4d4de38d456af1b422343')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
