# Maintainer: Asset Hoard <support@assethoard.com>
pkgname=asset-hoard-bin
_pkgname=asset-hoard
pkgver=0.1.14
pkgrel=1
pkgdesc="Game asset manager for organizing models, textures, sprites, and audio"
arch=('x86_64')
url="https://assethoard.com"
license=('custom:Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'openssl' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2' 'alsa-lib')
provides=('asset-hoard')
conflicts=('asset-hoard')
source=(
  "https://releases.assethoard.com/v${pkgver}/Asset%20Hoard_${pkgver}_x86_64.pkg.tar.zst"
  "https://releases.assethoard.com/v${pkgver}/Asset%20Hoard_${pkgver}_x86_64.pkg.tar.zst.sig"
)
sha256sums=('89bd438158cbac48a5f8c9ff00c80fa001942e2781b717eda0c3f9347ebeacb3' 'SKIP')
validpgpkeys=('2FE350A912F4525659E418CAA9B027A1392E7305')
options=('!strip')

package() {
  cd "$srcdir"
  bsdtar -x -f "Asset Hoard_${pkgver}_x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
}
