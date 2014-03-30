# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgver=1.3.1
pkgrel=1
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(i686 x86_64)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
source=("keefox.zip::https://addons.mozilla.org/firefox/downloads/file/248762/keefox-1.3.1-tb+fx-linux.xpi")
noextract=(keefox.zip)

prepare() {
    cd "$srcdir"

    unzip -qd keefox keefox.zip
}

package() {
    cd "$srcdir/keefox/deps"

    install -m 644 -D KeePassRPC.plgx "${pkgdir}/usr/share/keepass/plugins/rpc/KeePassRPC.plgx"
}

md5sums=('bd9e44f57a19493c50ebb100e309d588')
