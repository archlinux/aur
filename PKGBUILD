# Maintainer: SanskritFritz (gmail)

pkgname=wmdia
pkgver=1.04
pkgrel=2
pkgdesc="Dockapp to show pictures, films, webcam."
url="http://wmdia.sourceforge.net/"
license="AGPLv3"
depends=('libxcb' 'xcb-util' 'xcb-util-wm')
optdepends=('imagemagick: for showing pictures'
            'mplayer: for playing movies'
            'xorg-xprop: for showing tooltips')
arch=('i686' 'x86_64')
source=('http://wmdia.sourceforge.net/wmdia-2011-04-29-19.tar.bz2')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 wmdia "$pkgdir/usr/bin/wmdia"
	install -Dm755 diashow.sh "$pkgdir/usr/share/wmdia/diashow.sh"
	install -Dm755 playvideo.sh "$pkgdir/usr/share/wmdia/playvideo.sh"
	install -Dm755 set-command.sh "$pkgdir/usr/share/wmdia/set-command.sh"
	install -Dm755 set-tooltip.sh "$pkgdir/usr/share/wmdia/set-tooltip.sh"
	install -Dm755 showpicture.sh "$pkgdir/usr/share/wmdia/showpicture.sh"
	install -Dm644 README "$pkgdir/usr/share/doc/wmdia/README"
	install -Dm644 Changelog "$pkgdir/usr/share/doc/wmdia/Changelog"
	install -Dm644 AGPL-3.0.txt "$pkgdir/usr/share/doc/wmdia/AGPL-3.0.txt"
	gzip -c wmdia.1 > wmdia.1.gz
	install -Dm644 wmdia.1.gz "$pkgdir/usr/share/man/man1/wmdia.1.gz"
}

md5sums=('1d85c460d64a22d67037eb7f933447fd')
