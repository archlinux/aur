# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=intel-ipsec-mb
pkgver=1.1
pkgrel=1
pkgdesc='Intel(R) Multi-Buffer Crypto for IPsec Library'
url='https://github.com/intel/intel-ipsec-mb'
arch=('x86_64')
license=('BSD')
depends=('glibc')
makedepends=('nasm')
source=("https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
sha512sums=('aca5863d36b333c4c896549074242fb4c2c0a4d6598b27baa794944436527bdd6e1a5dbca9d39e0c3a89e61d7d175adcf5bf6c6cbdffd0a43bca1fea0be42ebe')

build() {
	cd "${pkgname}-${pkgver}"
	make INSTPATH="/nonexistent/intel-ipsec-mb.h"
}

package() {
	cd "${pkgname}-${pkgver}"
	make install PREFIX="$pkgdir/usr" MAN_DIR="$pkgdir/usr/share/man/man7" NOLDCONFIG=y
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
