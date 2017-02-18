
# Maintainer: dimosd <dimosdim at google mail>

_pkgname=elementary-kde
pkgname=$_pkgname-theme-git
pkgver=r27.5e8d20e
pkgrel=1
pkgdesc="Elementary theme for KDE"
arch=('any')
url="https://github.com/darkknightak/elementary-kde"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=($pkgname::git://github.com/darkknightak/elementary-kde.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
}

package() {
  cd $pkgname
  
  install -d  "$pkgdir/usr/share/icons/elementary-kde"
  cp -rp icons/* "$pkgdir/usr/share/icons/elementary-kde"
  
  install -d  "$pkgdir/usr/share/color-schemes"
  cp -rp color-schemes/* "$pkgdir/usr/share/color-schemes"
  
  install -d  "$pkgdir/usr/share/plasma/desktoptheme"
  cp -rp plasma/desktoptheme/* "$pkgdir/usr/share/plasma/desktoptheme"
  
  install -d  "$pkgdir/usr/share/aurorae/themes"
  cp -rp aurorae/* "$pkgdir/usr/share/aurorae/themes"
  
  install -d  "$pkgdir/usr/share/icons/elementary-cursors"
  cp -rp cursors/* "$pkgdir/usr/share/icons/elementary-cursors"
}
