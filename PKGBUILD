# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgver=1.4.0
pkgrel=2
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(i686 x86_64)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
makedepends=(unzip)
source=("keefox.zip::https://addons.mozilla.org/firefox/downloads/file/256452/keefox-1.4.0-fx+tb-linux.xpi")
noextract=(keefox.zip)

prepare() {
    cd "$srcdir"

    unzip -qd keefox keefox.zip
}

package() {
    cd "$srcdir/keefox/deps"

    install -m 644 -D KeePassRPC.plgx "${pkgdir}/usr/share/keepass/plugins/rpc/KeePassRPC.plgx"
}

md5sums=('b6eab59cd2af4e3489d8aa248a4c2ddf')
