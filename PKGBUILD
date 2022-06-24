# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-monero"
_projname="monero-python"
pkgver=1.0.3
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/monero-ecosystem/monero-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests' 'python-pycryptodomex' 'python-six' 'python-ipaddress'
        'python-varint' 'python-pynacl' 'python-pysocks')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('3577a2d0654f4b93534829107611e6fa')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
