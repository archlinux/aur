# Maintainer: BrainDamage
pkgname="naspro-bridges"
pkgrel=2
pkgver=0.5.1
pkgdesc="NASPRO bridges is a collection of bridges to LV2 that, once installed, allow you to use plugins developed for other plugin standards in LV2 hosts."
arch=('x86' 'x86_64')
url="http://naspro.sourceforge.net/plugins.html"
license=("LGPL")
depends=('naspro-bridge-it' 'naspro-core' 'dssi' 'ladspa')
sha1sums=("46427ea050da7bbb1a40ed405f5b5ce9975f6e9b")
source=("http://sourceforge.net/projects/naspro/files/naspro/$pkgver/naspro-bridges-$pkgver.tar.bz2")


build() {
	cd "$srcdir/naspro-bridges-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/naspro-bridges-$pkgver"
	make DESTDIR="$pkgdir" install
}