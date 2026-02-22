# Maintainer: Zoe Eisendle <zoe.pkgbuild@astech.hu>
pkgname=mptcpd
pkgver=0.14
pkgrel=0
pkgdesc="Multipath TCP daemon"
url="https://github.com/multipath-tcp/mptcpd"
arch=('any')
license=('GPL2')
depends=('ell')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b4e1c29319894c16030b6d359f635db9cbd649b78a01a6ff4f23873d3ac5ef8b5d9ff12281b893cd3be4f9fe40504e6d2a6b78ad7c54757a168da062bb4bbfcc')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
