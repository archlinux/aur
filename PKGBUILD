# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=arenatracker-bin
_pkgname=ArenaTracker
pkgver=6.5
pkgrel=1
pkgdesc="Tracks your Hearthstone Arena matches and cards."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
depends=('qt5-base' 'python-pyautogui' 'xcb-util-renderutil' 'libpng12')
provides=(arenatracker)
conflicts=('arenatracker-git' 'arenatracker')
source=("https://github.com/supertriodo/Arena-Tracker/releases/download/v$pkgver/Arena.Tracker.v$pkgver.Linux.zip"
	"ArenaTracker.ico"
	"ArenaTracker.desktop")

package() {
	install -dm755 $pkgdir/opt/$_pkgname
	install -dm755 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/share/icons/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/ArenaTracker $pkgdir/opt/$_pkgname/$_pkgname
	install -m755 $srcdir/ArenaTracker.ico $pkgdir/usr/share/icons/$_pkgname.ico
	install -m755 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	ln -s "/opt/$pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

md5sums=('d67ec61979a6145dc8a1288d895ecf04'
         '926afbd5024076726f89aa5eb8937a31'
         '57c93a7a9550450ee5d1d757a3b228fd')
