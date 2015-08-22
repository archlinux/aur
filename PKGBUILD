# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=qtads
pkgver=2.1.6
pkgrel=2
url="http://qtads.sourceforge.net/"
license=('GPL')
pkgdesc="A Qt-based interpreter for TADS text adventures. Support TADS 2 and 3, both for text-only and multimedia adventures."
arch=('i686' 'x86_64')
depends=('qt5-base' 'sdl_sound' 'sdl_mixer')
source=(http://downloads.sourceforge.net/sourceforge/qtads/$pkgname-$pkgver.tar.bz2
	$pkgname.desktop)
md5sums=('58ed4a2cb3e9615cbeaca266998b86d4'
         '53e37927a65bb80f4af9ba7d40d3f32a')

build() {
	cd $srcdir/$pkgname-$pkgver

	qmake
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	install -D -m755 qtads $pkgdir/usr/bin/qtads
	#desktop icon
	install -D -m644 ${pkgname}_48x48.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -D -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
