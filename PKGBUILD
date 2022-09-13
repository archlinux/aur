# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-monero"
_projname="monero-python"
pkgver=1.1
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/monero-ecosystem/monero-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests' 'python-pycryptodomex' 'python-six' 'python-ipaddress'
        'python-varint' 'python-pynacl' 'python-pysocks')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('98f3a20cddca7432a5e96f2b5f8b3cd2')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
