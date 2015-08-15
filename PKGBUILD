# Maintainer: Dialup Lama <dialuplama8@gmail.com>

pkgname=dsh
pkgver=0.25.9
pkgrel=1
pkgdesc="Distributed shell (or dancer’s shell) executes command remotely on several different machines at the same time."
arch=('any')
url="http://www.netfort.gr.jp/~dancer/software/dsh.html"
license=('GPL2')
depends=('libdshconfig')
source=("https://www.netfort.gr.jp/~dancer/software/downloads/$pkgname-$pkgver.tar.gz")        
md5sums=('60734780242172fca9e68d223654292d')

build() {
	cd "$pkgname-$pkgver"
	./configure \
        --prefix=/usr \
        --sysconfdir='/etc/$pkgname'
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
