# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=intel-ipsec-mb
pkgver=1.0
pkgrel=1
pkgdesc='Intel(R) Multi-Buffer Crypto for IPsec Library'
url='https://github.com/intel/intel-ipsec-mb'
arch=('x86_64')
license=('BSD')
makedepends=('nasm')
source=("https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
sha512sums=('a6665f73b6b6507922b6d7e2395cb9756c2d6c238447af29c0054b4e179586ce70004ed20c6b23838cfdd055cb1330d5d97228aae9866adba78e7cfc6554812b')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make install PREFIX="$pkgdir/usr" NOLDCONFIG=y
}
