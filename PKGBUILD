# Maintainer: Dan Johansen <strit@archlinux.org>

pkgname=arenatracker-bin
_pkgname=ArenaTracker
pkgver=25.09.01
pkgrel=1
pkgdesc="Tracks your Hearthstone Arena matches and cards."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL-2.0-or-later')
depends=(
        'xcb-util-renderutil'
        'libxkbcommon'
        'libxkbcommon-x11'
        'libx11'
        'libice'
        'libsm'
        'libxcb'
        'glib2'
        'fontconfig'
        'xcb-util-wm'
        'xcb-util-keysyms'
        'xcb-util-image'
        'freetype2'
)
provides=('arenatracker')
conflicts=(
          'arenatracker-git'
          'arenatracker'
)
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

sha256sums=('f89f0a5b4d7b953b444fa478955f2bb83bb1035e53761307bb1efab034bf83bd'
            'ff78d1575d609ceaba0ed2c5b3753fc8df91f9c078d1b482ee9bc0581406464c'
            '2a558e937bef79cafa916dbf7d997eaf0b5e3c6d5bc93d46f55f074bd3597486')
