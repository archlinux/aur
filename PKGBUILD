# Keep assets in their own pkgbase. makepkg fetches all pkgbase sources
# before selecting split packages; combining them would make the base shell
# download assets that it does not install.
pkgname=vgs-shell-assets
pkgver=0.4.0
pkgrel=1
pkgdesc='Optional VGS themes, wallpapers, and bundled icon themes'
arch=('any')
url='https://github.com/vanillagreencom/vgs'
license=('MIT')
depends=('vgs-shell')
source=("$url/releases/download/v$pkgver/vgs-$pkgver-assets.tar.gz")
sha256sums=('555c256d071827321035c67acc2dc75848701df73a3d38f3f73ea9cf956b47ce')

package() {
  cd "vgs-$pkgver-assets"
  DESTDIR="$pkgdir" VGS_THEME_BUNDLE=extras packaging/install-system.sh
}
