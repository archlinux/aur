# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>
pkgname='python-pycrate-git'
pkgver=r524.5be4c81
pkgrel=2
pkgdesc="Python library for manipulating various digital formats in an easy way."
arch=(any)
url="https://github.com/pycrate-org/pycrate"
license=('LGPL2.1')
makedepends=('git')
depends=('python')
optdepends=('python-lxml: The pycrate_diameter part uses lxml as optional dependency to translate xml files from IANA as Python dictionnaries when the diameter module is loaded.'
            'python-sctp: The pycrate_corenet part requires pysctp to run.'
            'python-cryptomobile: The pycrate_corenet part requires CryptoMobile to run. The pycrate_mobile/TS24301_EMM and pycrate_mobile/TS24501_FGMM modules use CryptoMobile as optional dependency to cipher / decipher LTE and 5G NAS messages.')
conflicts=("python-pycrate")
source=('pycrate::git+https://github.com/pycrate-org/pycrate#branch=master')
md5sums=('SKIP')

pkgver() {
	cd pycrate
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd pycrate
    python setup.py install --root="$pkgdir" --optimize=1
}
