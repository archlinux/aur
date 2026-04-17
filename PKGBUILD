# Maintainer: Antoine Bertin <antoine.bertin@archlinux.org>

pkgname=gruvbox-plus-icon-theme
pkgver=6.4.0 # renovate: datasource=github-tags depName=SylEleuth/gruvbox-plus-icon-pack
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
sha256sums=('0b651418f0305c1f99a7444b2d6027975e05741c92bb45d279c3e74fe4e891a7')

package() {
  cd "gruvbox-plus-icon-pack-$pkgver"
  install -d "$pkgdir/usr/share/icons"
  cp -r ./Gruvbox-Plus-Dark "$pkgdir/usr/share/icons/Gruvbox-Plus-Dark"
  cp -r ./Gruvbox-Plus-Light "$pkgdir/usr/share/icons/Gruvbox-Plus-Light"
}
