# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=adwaita-blue-icon-theme-git
_pkgname=${pkgname%-git}
_pkgver=1.0.1
pkgver=17
pkgrel=1
pkgdesc="Adwaita icon theme with blue folder icons"
arch=(any)
url="https://github.com/realmazharhussain/adwaita-blue-icon-theme"
license=('GPL')
source=("$_pkgname"::"git+https://github.com/realmazharhussain/${_pkgname}.git")
md5sums=('SKIP')
depends=(adwaita-icon-theme)
provides=("${_pkgname}=${_pkgver}")
conflicts=("${_pkgname}")

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}
package() {
   cd "$srcdir"/"$_pkgname"
   mkdir -p "$pkgdir"/usr/share/icons
   cp -Rt "$pkgdir"/usr/share/icons Adwaita-Blue
}
