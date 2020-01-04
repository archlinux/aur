# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>
pkgname='python-cryptomobile'
pkgver=r26.c17b23a
pkgrel=1
pkgdesc="This toolkit implements python wrappers around 3G and LTE encryption and integrity protection algorithms, COMP128, Milenage and TUAK authentication algorithms."
arch=(any)
url="https://github.com/P1sec/CryptoMobile"
license=('GPL')
makedepends=('git')
depends=('python')
source=('pycrate::git+https://github.com/P1sec/CryptoMobile#branch=master')
md5sums=('SKIP')

pkgver() {
	cd pycrate
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd pycrate
    python setup.py install --root="$pkgdir" --optimize=1
}
