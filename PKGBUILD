# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=arena-tracker
pkgver=3.44
pkgrel=2
pkgdesc="Tracks your Hearthstone Arena matches and cards"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
depends=('qt5-base' 'python-pyautogui' 'intel-tbb' 'xcb-util-renderutil')
provides=(arena-tracker)
conflicts=('arena-tracker' 'arena-tracker-git')
source=("https://github.com/supertriodo/Arena-Tracker/releases/download/v$pkgver/Arena.Tracker.v$pkgver.Linux.zip"
	"ArenaTracker.ico"
	"arena-tracker.desktop")

#prepare() {
#	zip -xpf Arena.Tracker.v$pkgver.Linux.zip
#}

#build() {
#	cd "Arena-Tracker"
#	qmake ArenaTracker.pro
#	make
#}


package() {
	install -dm755 $pkgdir/opt/$pkgname
	install -dm755 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/share/icons/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/"Arena Tracker v$pkgver Linux"/ArenaTracker $pkgdir/opt/$pkgname/$pkgname
	install -m755 $srcdir/ArenaTracker.ico $pkgdir/usr/share/icons/$pkgname.ico
	install -m755 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
md5sums=('118c82a9954c2a177be16a2afce3f8b3'
	'81cbf4e6a4d8711ba29ad526b4c2c755'
	'c81a05fdc3b96092fb363f841267e21f')
