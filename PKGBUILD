# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>
pkgname=python-pycrate
pkgver=0.5.5
pkgrel=1
pkgdesc="Python library for manipulating various digital formats in an easy way."
arch=(any)
conflicts=("python-pycrate-git")
depends=('python')
optdepends=('python-lxml: The pycrate_diameter part uses lxml as optional dependency to translate xml files from IANA as Python dictionnaries when the diameter module is loaded.'
            'python-sctp: The pycrate_corenet part requires pysctp to run.'
            'python-cryptomobile: The pycrate_corenet part requires CryptoMobile to run. The pycrate_mobile/TS24301_EMM and pycrate_mobile/TS24501_FGMM modules use CryptoMobile as optional dependency to cipher / decipher LTE and 5G NAS messages.')
url="https://github.com/P1sec/pycrate"
license=('LGPL2.1')
source=(https://github.com/P1sec/pycrate/archive/${pkgver}.tar.gz)
md5sums=('0c911b9b82a7d1c4034427472d84d9d6')

package() {
    cd pycrate-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}
