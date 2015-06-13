# Maintainer: SanskritFritz (gmail)
# Contributor: bidulock (AUR)

pkgname=wmmp
pkgver=0.10.0
pkgrel=3
pkgdesc="Dockapp for interfacing MPD."
url="http://mpd.wikia.com/wiki/Client:WMmp"
arch=('i686' 'x86_64')
license=('GPLv2')
source=("http://www.musicpd.org/download/WMmp/$pkgver/WMmp-$pkgver.tar.gz")

build() {
	cd "$srcdir/WMmp-$pkgver"
	./configure --with-default-port=6600 --prefix=/usr
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/WMmp-$pkgver"
	make DESTDIR="$pkgdir" install
}

md5sums=('846c3d66d360d50e792377cdb5f0b572')
