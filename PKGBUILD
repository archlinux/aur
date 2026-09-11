# Maintainer: Asset Hoard <support@assethoard.com>
pkgname=asset-hoard-bin
_pkgname=asset-hoard
pkgver=0.2.1
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
sha256sums=('fee2b77f95aa27a13dd1d596d03f4680cb3d045ce66f6d03a60efb848b4fce56' 'SKIP')
validpgpkeys=('2FE350A912F4525659E418CAA9B027A1392E7305')
options=('!strip')

package() {
  cd "$srcdir"
  bsdtar -x -f "asset-hoard_${pkgver}_x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
}
