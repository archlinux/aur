# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ambiance-rw-git
pkgver=r7.d83db5d
pkgrel=1
pkgdesc="A re-interpretation of the Ambiance theme. "
arch=(any)
url="https://www.gnome-look.org/p/1197991/"
license=(GPL3)
makedepends=(git)
provides=(ambiance-rw)
conflicts=(ambiance-rw)
options=(!strip)
source=("${pkgname%-git}::git+https://github.com/paullinuxthemer/Ambiance-RW.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/${pkgname%-git}"/Ambiance-RW "${pkgdir}"/usr/share/themes/
  cp -r "${srcdir}/${pkgname%-git}"/Ambiance-RW{-BLUE,-DS,-DS-BLUE} "${pkgdir}"/usr/share/themes/
}
