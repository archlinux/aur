# Maintainer: Dan Johansen <strit at strits dot dk>

pkgname=arenatracker-bin
_pkgname=ArenaTracker
pkgver=24.10
pkgrel=2
pkgdesc="Tracks your Hearthstone Arena matches and cards."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL-2.0-or-later')
depends=('qt5-base'
         'xcb-util-renderutil'
         'libpng12'
         'openssl-1.0'
         'gtk2')
provides=('arenatracker')
conflicts=('arenatracker-git'
           'arenatracker')
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
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums=('5c6de347cb20926f8d81eaea5e0d93d16d9b536783d8c173adddf14966abe395'
            'ff78d1575d609ceaba0ed2c5b3753fc8df91f9c078d1b482ee9bc0581406464c'
            '2a558e937bef79cafa916dbf7d997eaf0b5e3c6d5bc93d46f55f074bd3597486')
