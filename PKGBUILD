# Maintainer: Asset Hoard <support@assethoard.com>
pkgname=asset-hoard-bin
_pkgname=asset-hoard
pkgver=0.3.1
pkgrel=1
pkgdesc="Game asset manager for organizing models, textures, sprites, and audio"
arch=('x86_64')
url="https://assethoard.com"
license=('custom:Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'openssl' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2' 'alsa-lib')
provides=('asset-hoard')
conflicts=('asset-hoard')
source=(
  "https://releases.assethoard.com/v${pkgver}/asset-hoard_${pkgver}_x86_64.pkg.tar.zst"
  "https://releases.assethoard.com/v${pkgver}/asset-hoard_${pkgver}_x86_64.pkg.tar.zst.sig"
)
sha256sums=('f1a3464a6ae875413d434e014da44c090753f596400503d7a09430f69eb82879' 'SKIP')
validpgpkeys=('2FE350A912F4525659E418CAA9B027A1392E7305')
options=('!strip')

package() {
  cd "$srcdir"
  bsdtar -x -f "asset-hoard_${pkgver}_x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
}
