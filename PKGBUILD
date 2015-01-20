# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgver=1.4.6
pkgrel=1
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(i686 x86_64)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
makedepends=(unzip)
install="${pkgname}.install"
source=("keefox.zip::https://addons.mozilla.org/firefox/downloads/file/293246/keefox-1.4.6-fx+tb-linux.xpi?src=external-kforg-download")
noextract=(keefox.zip)

prepare() {
    cd "$srcdir"

    unzip -qd keefox keefox.zip
}

package() {
    cd "$srcdir/keefox/deps"

    install -m 644 -D KeePassRPC.plgx "${pkgdir}/usr/share/keepass/plugins/KeePassRPC.plgx"
}

md5sums=('0875496fc1526033e56e4e095ed53cbb')
sha384sums=('9060c8aeec8af79494043fccd26184f77fff58bc929cfe96e97f9e3c8971c496fff5511588985f508c11d48cd8cd47d7')
