# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=arena-tracker
pkgver=3.41
pkgrel=1
pkgdesc="Tracks your Hearthstone Arena matches and cards"
arch=('i686' 'x86_64')
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
	cp -R $srcdir/"Arena Tracker v$pkgver Linux"/HSCards $pkgdir/opt/$pkgname/HSCards
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	ln -s "/opt/$pkgname/HSCards/" "$pkgdir/usr/bin/"
	chmod 0777 "$pkgdir/opt/$pkgname/HSCards/"
}
md5sums=('a745a81be2e6e8fc9adca6d7eaf540d6'
	'81cbf4e6a4d8711ba29ad526b4c2c755'
	'c81a05fdc3b96092fb363f841267e21f')
