# Maintainer: jose1711 <jose1711@gmail.com>

pkgname=openredalert_bin
pkgver=r462
pkgrel=2
pkgdesc="Westwood red alert game engine"
arch=('i686')
url="http://www.ohloh.net/projects/openredalert"
license=('GPL-2')
install=('openredalert.install')
depends=('sdl_mixer')
source=("http://downloads.sourceforge.net/openredalert/openredalert-${pkgver}-linux.tar.gz"
"http://sourceforge.net/projects/openredalert/files/ra95demo/%5BUnnamed%20release%5D/ra95demo.zip/download")
md5sums=('e6939e2f199fabaa9cbf9b057e46e577'
         'b44ab9ec1bc634ea755587d1988e3722')

package() {
	cd ${srcdir}/openredalert
	mkdir -p $pkgdir/usr/share/openredalert/data/settings/{ra,} $pkgdir/usr/share/openredalert/data/mix
	install -D -m 644 data/settings/* $pkgdir/usr/share/openredalert/data/settings || true
	install -D -m 644 data/settings/ra/* $pkgdir/usr/share/openredalert/data/settings/ra
	install -D -m 755 openredalert $pkgdir/usr/share/openredalert/openredalert
	install -D -m 644 ${srcdir}/ra95demo/INSTALL/{MAIN,REDALERT}.MIX $pkgdir/usr/share/openredalert/data/mix
	}
