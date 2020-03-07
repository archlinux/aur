# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=intel-ipsec-mb
pkgver=0.53
pkgrel=1
pkgdesc='Intel(R) Multi-Buffer Crypto for IPsec Library'
url='https://github.com/intel/intel-ipsec-mb'
arch=('x86_64')
license=('BSD')
makedepends=('nasm')
source=("https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
sha512sums=('15fb867fde819fda0d26eea56d5d1715e98de48638e9a195af9cde3a47cbf586b5cb5a910d923b6b796072821207bfe66a4d7d15302b4d54c593cb20eb3ff9e5')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make install PREFIX="$pkgdir/usr" NOLDCONFIG=y
}
