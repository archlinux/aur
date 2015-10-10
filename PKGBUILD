# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-icons-trademarked-git
pkgver=r429.49689eb
pkgrel=1
pkgdesc='KDE Breeze icon sets (including trademarked logos)'
arch=(any)
url='https://github.com/NitruxSA/breeze-icon-theme'
license=(LGPL)
depends=(hicolor-icon-theme)
conflicts=(breeze-icons)
provides=(breeze-icons)
source=('git://github.com/NitruxSA/breeze-icon-theme#branch=trademarked-logos')
md5sums=('SKIP')
#install=$pkgname.install

pkgver() {
  cd breeze-icon-theme
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd breeze-icon-theme
 
  install -d "$pkgdir"/usr/share/icons
  cp -r Breeze* "$pkgdir"/usr/share/icons
}
