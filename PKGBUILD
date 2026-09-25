# Maintainer: Asset Hoard <support@assethoard.com>
pkgname=asset-hoard-bin
_pkgname=asset-hoard
pkgver=0.2.2
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
sha256sums=('3e8e4b7cdff296b66fbd827da39c7d385d2dca4e4199e2f1b258f5639010c9a3' 'SKIP')
validpgpkeys=('2FE350A912F4525659E418CAA9B027A1392E7305')
options=('!strip')

package() {
  cd "$srcdir"
  bsdtar -x -f "asset-hoard_${pkgver}_x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
}
