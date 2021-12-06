# Co-maintainer: Jovial Joe Jayarson <jovial7joe@hotmail.com>

pkgname=sddm-theme-astronaut
_themename=astronaut
pkgver=1.0
pkgrel=1
pkgdesc="Beautiful SDDM astronaut theme"
arch=("any")
url="https://github.com/joe733/sddm-theme-astronaut"
license=("LGPL3")
depends=("sddm")
makedepends=("git")
source=("git+https://github.com/joe733/sddm-theme-astronaut.git")
md5sums=("SKIP")
package() {
  cd "${srcdir}/${pkgname}"
  _themedir="${pkgdir}/usr/share/sddm/themes/$_themename"

  for N in "Main.qml" "metadata.desktop" "theme.conf" "theme.conf.user" Assets/Card-Background/*.png Assets/Icons/*.svg Assets/Wallpapers/*.png Components/*.qml; do
    install -Dm644 $N "${_themedir}/$N"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"

}
