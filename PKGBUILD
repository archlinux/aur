# Maintainer: NodeRelay <joe@linuxdojo.org>
pkgname=uplink-irc-bin
pkgver=2026.7.7
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
sha256sums=('f38d101d6d4e00b2db29deb1395e89df2780683ed56a3f20c1aff1de427ddfad'
            'e23d7bc0e13cc05703e84f0cd1acfb84cef3717e601f56ac6a141757dc73b620'
            'db371f3814a57af5509173ac25f6b6852b5aa170774cdd411bd3870127ebd076'
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
