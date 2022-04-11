# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python2-monero"
_projname="monero-python"
pkgver=1.0.1
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/monero-ecosystem/monero-python'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-pycryptodomex' 'python2-six' 'python2-ipaddress'
        'python2-varint' 'python2-pynacl' 'python2-pysocks')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('a9c8c6f34b4af1ecaee9c808c89de8ad')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
