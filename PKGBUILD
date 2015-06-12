# Contributor: jose1711 <jose1711@gmail.com>
pkgname=openredalert_bin
pkgver=r462
pkgrel=1
pkgdesc="Westwood red alert game engine"
arch=('i686')
url="http://www.ohloh.net/projects/openredalert"
license=('GPL-2')
install=('openredalert.install')
depends=('sdl_mixer')
source=("http://downloads.sourceforge.net/openredalert/openredalert-${pkgver}-linux.tar.gz"
"ftp://ftp.westwood.com/pub/redalert/previews/demo/ra95demo.zip")
md5sums=('e6939e2f199fabaa9cbf9b057e46e577'
'b44ab9ec1bc634ea755587d1988e3722')

build() {
	cd ${startdir}/src/openredalert
	mkdir -p $pkgdir/usr/share/openredalert/data/settings/{ra,} $pkgdir/usr/share/openredalert/data/mix
        install -D -m 644 data/settings/* $pkgdir/usr/share/openredalert/data/settings
	install -D -m 644 data/settings/ra/* $pkgdir/usr/share/openredalert/data/settings/ra
	install -D -m 755 openredalert $pkgdir/usr/share/openredalert/openredalert
	install -D -m 644 ${startdir}/src/ra95demo/INSTALL/{MAIN,REDALERT}.MIX $pkgdir/usr/share/openredalert/data/mix
	}
