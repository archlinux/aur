# Maintainer: Dan Johansen <strit@archlinux.org>

pkgname=arenatracker-bin
_pkgname=ArenaTracker
pkgver=25.07.01
pkgrel=1
pkgdesc="Tracks your Hearthstone Arena matches and cards."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL-2.0-or-later')
depends=(
        'xcb-util-renderutil'
        'openssl-1.0'
        'gtk2'
        'libx11'
        'libice'
        'libpng'
        'libjpeg-turbo'
        'libsm'
        'libxcb'
        'glib2'
        'fontconfig'
        'xcb-util-wm'
        'xcb-util-keysyms'
        'xcb-util-image'
        'libxi'
        'freetype2'
        'libdrm'
        'harfbuzz'
        'libglvnd'
        'zlib'
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

sha256sums=('6bff6e50cad89fed310eb4535e89f7e40fdb14615e253bfbf49a3671c62a37d7'
            'ff78d1575d609ceaba0ed2c5b3753fc8df91f9c078d1b482ee9bc0581406464c'
            '2a558e937bef79cafa916dbf7d997eaf0b5e3c6d5bc93d46f55f074bd3597486')
