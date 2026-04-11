# Maintainer: Antoine Bertin <antoine.bertin@archlinux.org>

pkgname=gruvbox-plus-icon-theme
pkgver=6.3.0 # renovate: datasource=github-tags depName=SylEleuth/gruvbox-plus-icon-pack
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
sha256sums=('ab722bed0271eba05d89bf62fe804c80051fe6e21303ce1c331d0e7c4bed8e5e')

package() {
  cd "gruvbox-plus-icon-pack-$pkgver"
  install -d "$pkgdir/usr/share/icons"
  cp -r ./Gruvbox-Plus-Dark "$pkgdir/usr/share/icons/Gruvbox-Plus-Dark"
  cp -r ./Gruvbox-Plus-Light "$pkgdir/usr/share/icons/Gruvbox-Plus-Light"
}
