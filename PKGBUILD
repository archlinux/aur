# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Peter <craven@gmx.net>

pkgname=pktriggercord
pkgver=0.84.04
pkgrel=1
pkgdesc="Remote control (tethering) for Pentax DSLR cameras"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://pktriggercord.melda.info/"
license=(LGPL3)
depends=(gtk2)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asalamon74/$pkgname/releases/download/v$pkgver/pkTriggerCord-$pkgver.src.tar.gz")
md5sums=('626141d036e2f857ea6fc01b04cdf6db')

prepare() {
	cd "$pkgname-$pkgver"
        sed -i 's|PREFIX ?=.*|PREFIX = /usr|' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make LDFLAGS=-lm PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
