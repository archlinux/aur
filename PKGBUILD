# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>
pkgname='python-cryptomobile'
pkgver=r74.b13e59b
pkgrel=1
pkgdesc="This toolkit implements python wrappers around 3G and LTE encryption and integrity protection algorithms, COMP128, Milenage and TUAK authentication algorithms."
arch=(any)
url="https://github.com/mitshell/CryptoMobile"
license=('GPL')
makedepends=('git')
depends=('python')
source=('pycrate::git+https://github.com/mitshell/CryptoMobile#branch=master')
md5sums=('SKIP')

pkgver() {
	cd pycrate
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd pycrate
    python setup.py install --root="$pkgdir" --optimize=1
}
