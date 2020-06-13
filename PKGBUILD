# Maintainer: Zoe Eisendle <zoe.pkgbuild@astech.hu>
pkgname=mptcpd
pkgver=0.5
pkgrel=1
pkgdesc="Multipath TCP daemon"
url="https://github.com/intel/mptcpd"
arch=('any')
license=('GPL2')
depends=('ell')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e56f0e46292f8a75c98c6a064cf9c8982ed048fc1ea7748427662e0ea407f3abb59f3fcfe483b90db5e830bbb6eef27677eb323493789e91065741475da768bf')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
