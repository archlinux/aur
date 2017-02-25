# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Lucjan SQ5FGB <lucck at boff dot pl>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=linpsk
pkgver=1.3.5
pkgrel=1
pkgdesc="Ham Radio PSK31/63 engine"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/linpsk/"
license=('GPL')
depends=('fftw' 'qt5-multimedia' 'hamradio-menus')
optdepends=('hamlib: for rig control')
makedepends=('pkg-config')
source=(http://sourceforge.net/projects/linpsk/files/linpsk/$pkgname-$pkgver.tar.gz)

build() {
	cd $srcdir/$pkgname-$pkgver

	qmake-qt5 linpsk.pro
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	install -Dm755 linpsk $pkgdir/usr/bin/linpsk

	mkdir -p $pkgdir/usr/share/$pkgname/doc
	install -m 0644 asoundrc $pkgdir/usr/share/$pkgname/doc/
	install -m 0644 README $pkgdir/usr/share/$pkgname/doc/

	install -Dm644 data/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 images/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('f0ec386f2e06d800c278e4ee28fd5eba')
sha256sums=('64bf5c699611dd3fad2e28df2eebd2bf60f6b3b48ce51f84efa92f250ab3cf4a')
