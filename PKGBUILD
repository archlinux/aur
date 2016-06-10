# Maintainer: ReNoM <renom@list.ru>
pkgname=mednafen-server
pkgver=0.5.2
pkgrel=1
pkgdesc="Server for Mednafen network game."
arch=(i686 x86_64)
url="http://mednafen.sourceforge.net/"
license=("GPL")
source=(http://mednafen.fobby.net/releases/files/$pkgname-$pkgver.tar.gz)
sha256sums=('4933e87e7072efa2ffa965dcc790080984523e83f49eeb49e20fadcca1a1ca19')

build() {
	cd "$srcdir/$pkgname"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/share/mednafen-server
	mkdir -p $pkgdir/usr/bin/
	install -D -m 644 -t $pkgdir/usr/share/mednafen-server standard.conf
	install -D -m 644 $srcdir/mednafen-server/src/mednafen-server $pkgdir/usr/bin/mednafen-server
	chmod +x $pkgdir/usr/bin/mednafen-server
}

