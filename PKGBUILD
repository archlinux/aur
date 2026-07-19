# Maintainer: NodeRelay <joe@linuxdojo.org>
pkgname=uplink-irc-bin
pkgver=2026.7.8
pkgrel=1
pkgdesc="Fast, secure, IRCv3-featured IRC client (Qt6, prebuilt binary)"
arch=('x86_64')
url="https://uplinkirc.chat"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'qt6-websockets' 'qtkeychain-qt6' 'hicolor-icon-theme')
provides=('uplink-irc')
conflicts=('uplink-irc')
_gh=https://github.com/noderelay/UplinkIRC
source=("$_gh/releases/download/v$pkgver/Uplink-v$pkgver-linux-x86_64.tar.gz"
        "$pkgname-$pkgver.desktop::$_gh/raw/v$pkgver/packaging/io.github.noderelay.UplinkIRC.desktop"
        "$pkgname-$pkgver.metainfo.xml::$_gh/raw/v$pkgver/packaging/io.github.noderelay.UplinkIRC.metainfo.xml"
        "$pkgname-$pkgver.png::$_gh/raw/v$pkgver/packaging/io.github.noderelay.UplinkIRC.png")
sha256sums=('4bb45c0129e20cc77900848321687e2320f4d42a988bb31372961963baf39733'
            'e23d7bc0e13cc05703e84f0cd1acfb84cef3717e601f56ac6a141757dc73b620'
            '479b0237c2911318648aa3d63cc47fb7dff867b99d6b58a48c7b03c0512d4315'
            '6513f9608ef456d246791cff08116e84c2c1f591fc6c8de7ea0d43e53a6a8d12')

package() {
    install -Dm755 Uplink/Uplink "$pkgdir/usr/bin/Uplink"
    mkdir -p "$pkgdir/usr/share/uplink/themes"
    install -m644 Uplink/themes/*.toml "$pkgdir/usr/share/uplink/themes/"
    install -Dm644 "$pkgname-$pkgver.desktop" \
        "$pkgdir/usr/share/applications/io.github.noderelay.UplinkIRC.desktop"
    install -Dm644 "$pkgname-$pkgver.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/io.github.noderelay.UplinkIRC.metainfo.xml"
    install -Dm644 "$pkgname-$pkgver.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.noderelay.UplinkIRC.png"
}
