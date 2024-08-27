# Maintainer: zaeyee <zaeyee@163.com>
pkgname="phizclip-studio"
pkgver="1.2.0"
pkgrel=1
pkgdesc="PhizClip-Studio"
arch=("x86_64")
url="https://open.phiz.chat/"
license=('custom')
depends=()
source=(
  "${pkgname}-v${pkgver}-${pkgrel}.AppImage"::"https://i.ouzero.com:811/api/public/dl/aK6V_ejL"
  "${pkgname}.desktop"
  "${pkgname}.png")
sha256sums=('fb2d5a1913e4f6e359d324b739ea1b77ea13995d49436728d4e00d37935bfdab'
            '1e2d60584bec00079891b8b55d142bbfa8a6fac36da037bcb383c5b950e9ae5e'
            '53239505b912d9cb80a1f3e22ead56edb56a4a0d8b6b99536a6ab46a1ae8e9a1')
options=(!strip)

package() {
  install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-${pkgrel}.AppImage" "${pkgdir}/opt/PhizClip-Studio/PhizClip-Studio.AppImage"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/PhizClip-Studio.png"
  # install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin"
}
