# Maintainer: sihuan <sihuan at sakuya.love>

_pkgname=thenewplayerfree
pkgname=thenewplayerfree-bin
pkgver=1.6.1
pkgrel=1
arch=('x86_64')
pkgdesc="The best video/streaming media player under UNIX"
url="https://github.com/sudormroot/thenewplayer_builds"
depends=('qt5-base' 'qt5-multimedia')
license=('unknown')
source=("https://raw.githubusercontent.com/sudormroot/thenewplayer_builds/master/releases/linux/thenewplayerfree.v1_6_1.i386.tgz")
sha512sums=('c2d4515aef29ab47b448b1487de76f2998900e6eca13d3941cd6e5c0b6a1d28f598fbad7bc31fc2aafece85c4ba5b3045f456ffd88a65cb848547df67b88886a')


prepare() {
    bsdtar -xf "$srcdir/thenewplayerfree.v1_6_1.i386.deb"
    bsdtar -xf "$srcdir/data.tar.xz"
}

package() {

    install -Dm755 "$srcdir/usr/local/thenewplayerfree/bin/thenewplayerfree" "$pkgdir/usr/bin/thenewplayerfree"

    install -Dm644 "$srcdir/usr/local/thenewplayerfree/images/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/thenewplayerfree.png"

    mkdir -p "$pkgdir/usr/share/thenewplayerfree/lang/"
    install -Dm644 "$srcdir/usr/local/thenewplayerfree/languages/"* "$pkgdir/usr/share/thenewplayerfree/lang/"

    echo "[Desktop Entry]
Version=1.6.1
Encoding=UTF-8
Name=TheNewPlayerFree
Comment=The best video/streaming media player under UNIX
Exec=thenewplayerfree
Icon=thenewplayerfree
Terminal=false
Type=Application
Categories=AudioVideo;Player;
Keywords=IPTV;Player;Movie;Video;
    " > "$srcdir/thenewplayerfree.desktop"
    install -Dm644 "$srcdir/thenewplayerfree.desktop" "$pkgdir/usr/share/applications/thenewplayerfree.desktop"
}