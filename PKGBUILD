# Maintainer: Antoine Bertin <antoine.bertin@archlinux.org>

pkgname=gruvbox-plus-icon-theme
pkgver=6.5.0 # renovate: datasource=github-tags depName=SylEleuth/gruvbox-plus-icon-pack
pkgrel=1
pkgdesc="Icon theme based on Gruvbox color scheme"
arch=(any)
url=https://github.com/SylEleuth/gruvbox-plus-icon-pack
license=(GPL3)
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=(gruvbox-plus-icon-theme)
conflicts=(gruvbox-plus-icon-theme-git)
options=(!strip !emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('953df8b42e12488014db9c539de54188549fe587081c3c495fc47cee4e26d45f')

package() {
  cd "gruvbox-plus-icon-pack-$pkgver"
  install -d "$pkgdir/usr/share/icons"
  cp -r ./Gruvbox-Plus-Dark "$pkgdir/usr/share/icons/Gruvbox-Plus-Dark"
  cp -r ./Gruvbox-Plus-Light "$pkgdir/usr/share/icons/Gruvbox-Plus-Light"
}
