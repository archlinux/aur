# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgver=1.4.3
pkgrel=1
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(i686 x86_64)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
makedepends=(unzip)
source=("keefox.zip::https://addons.mozilla.org/firefox/downloads/file/274580/keefox-1.4.3-fx+tb-linux.xpi?src=external-kforg-download")
noextract=(keefox.zip)

prepare() {
    cd "$srcdir"

    unzip -qd keefox keefox.zip
}

package() {
    cd "$srcdir/keefox/deps"

    install -m 644 -D KeePassRPC.plgx "${pkgdir}/usr/share/keepass/plugins/rpc/KeePassRPC.plgx"
}

md5sums=('90617c58a8c11bb51433fe44a107fbfe')
