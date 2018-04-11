# Maintainer: BrainDamage
pkgname="naspro-bridge-it"
pkgrel=2
pkgver=0.5.1
pkgdesc="NASPRO Bridge it is a little helper library to develop insert-your-API-here to LV2 bridges."
arch=('x86' 'x86_64')
url="http://naspro.sourceforge.net/libraries.html#naspro-bridge-it"
license=("LGPL")
depends=('naspro-core' 'lv2' 'sratom')
sha1sums=("2dbc7727f1c58000abed39cfc40c4ade29cc6d92")
source=("http://sourceforge.net/projects/naspro/files/naspro/$pkgver/naspro-bridge-it-$pkgver.tar.bz2")


build() {
	cd "$srcdir/naspro-bridge-it-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/naspro-bridge-it-$pkgver"
	make DESTDIR="$pkgdir" install
}