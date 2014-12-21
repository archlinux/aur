# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgver=1.4.4
pkgrel=2
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(i686 x86_64)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
makedepends=(unzip)
install="${pkgname}.install"
source=("keefox.zip::https://addons.mozilla.org/firefox/downloads/file/281598/keefox-1.4.4-tb+fx.xpi?src=version-history")
noextract=(keefox.zip)

prepare() {
    cd "$srcdir"

    unzip -qd keefox keefox.zip
}

package() {
    cd "$srcdir/keefox/deps"

    install -m 644 -D KeePassRPC.plgx "${pkgdir}/usr/share/keepass/plugins/KeePassRPC.plgx"
}

md5sums=('874d111743c2e430ddfc9ef211a726b8')
sha384sums=('dad78e83ddfb002ac5ae94dae11035f84e8cf08dc3d613d5151f3f48409d4d226b81f18f68ceb68d0904072d5584adb0')
