# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=intel-ipsec-mb
pkgver=0.55
pkgrel=1
pkgdesc='Intel(R) Multi-Buffer Crypto for IPsec Library'
url='https://github.com/intel/intel-ipsec-mb'
arch=('x86_64')
license=('BSD')
makedepends=('nasm')
source=("https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
sha512sums=('d98d4688347aed991f6b218f19e1158bfc34baf66ac2198e2e1b953c29afa230c68eb394ea0deecf3f3d7370906e2bac7e787ad2dd7d14aa6538f65e6c4eabeb')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make install PREFIX="$pkgdir/usr" NOLDCONFIG=y
}
