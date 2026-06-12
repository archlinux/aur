# Maintainer: Ardox <ardox@axos-project.com>
pkgname="sleex-artworks-git"
_pkgname="sleex-artworks"
pkgver=1.0.r5.cb4a05e
pkgrel=1
pkgdesc="Icons and wallpapers for Sleex desktop environment"
arch=("any")
license=('GPL3')
arch=("any")
url="https://github.com/axos-project/sleex-artworks"
source=("https://github.com/axos-project/sleex-artworks.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
   cd "$srcdir/$_pkgname/src"
   mkdir -p ${pkgdir}/usr/share/pixmaps/sleex
   cp -r logo/* ${pkgdir}/usr/share/pixmaps/sleex

   mkdir -p ${pkgdir}/usr/share/backgrounds/sleex
   cp -r wallpapers/* ${pkgdir}/usr/share/backgrounds/sleex/
}
