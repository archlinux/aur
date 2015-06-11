# Contributor: Simo Leone <leone.simo AT gmail DOT com>
pkgname=amtterm
pkgver=1.3
pkgrel=1
pkgdesc="Tools to connect to Intel AMT enabled machines via Serial-Over-LAN"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/blog/linux/$pkgname/"
license=('GPL2')
depends=('perl-soap-lite')
makedepends=('vte')
optdepends=('vte: for the gamt GUI')
source=("http://www.kraxel.org/cgit/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
md5sums=('23c38adb273657345fe094ab33d00173')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" prefix=/usr install
}

# vim: set ft=sh ts=4 sw=4 noet:
