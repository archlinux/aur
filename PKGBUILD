# Maintainer: YaYPIXXO <viggo@lekdorf.com>
pkgname=loginized
pkgver=1.4.0
pkgrel=2
pkgdesc="Gnome GDM Login Theme Manager."
arch=('x86_64')
url="https://github.com/juhaku/loginized"
license=('GPL3')
depends=('glib2' 'xdg-utils' 'gtk3' 'nss' 'libxss')
source=(
https://github.com/juhaku/loginized/releases/download/${pkgver}/loginized-${pkgver}.pacman
)
sha256sums=(
'74e3096aabcb860b7bb2d2c29bba04466e43e7a0e155c8d4f8447a76cf53e31b'
)

package () {

  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/opt/Loginized" "${pkgdir}/opt/"

  install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  icons_dir="/usr/share/icons/hicolor/256x256/apps"
  install -d "${pkgdir}/${icons_dir}"
  install -m644 "${srcdir}${icons_dir}/${pkgname}.png" "${pkgdir}${icons_dir}/${pkgname}.png"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/Loginized/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

}
