# Maintainer: xCaptaiN09 <https://github.com/xCaptaiN09>
pkgname=glyph-sddm-git
pkgver=r1.1af789c
pkgrel=1
pkgdesc="A high-end Nothing Phone inspired SDDM theme with adaptive typography and obsidian glass aesthetics (Qt6/Universal)"
arch=('any')
url="https://github.com/xCaptaiN09/glyph-sddm"
license=('MIT')
install=glyph-sddm-git.install
depends=('sddm' 'qt6-declarative' 'qt6-svg' 'qt6-quickcontrols2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/xCaptaiN09/glyph-sddm.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -dm755 "${pkgdir}/usr/share/sddm/themes/glyph"
  cp -r * "${pkgdir}/usr/share/sddm/themes/glyph/"
  
  # Remove unnecessary files from the system installation
  rm -rf "${pkgdir}/usr/share/sddm/themes/glyph/.git"
  rm -rf "${pkgdir}/usr/share/sddm/themes/glyph/screenshots"
  rm -f "${pkgdir}/usr/share/sddm/themes/glyph/README.md"
  rm -f "${pkgdir}/usr/share/sddm/themes/glyph/install.sh"
  rm -f "${pkgdir}/usr/share/sddm/themes/glyph/LICENSE"
}
