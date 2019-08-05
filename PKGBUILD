# Maintainer: YaYPIXXO <viggo@lekdorf.com>
pkgname=loginized
pkgver=1.3.3
pkgrel=1
pkgdesc="Gnome GDM Login Theme Manager."
arch=('x86_64')
url="https://github.com/juhaku/loginized"
license=('GPL3')
depends=('glib2' 'xdg-utils')
source=(
https://github.com/juhaku/loginized/releases/download/1.3.3/loginized-${pkgver}.pacman
)
sha256sums=(
'95257349ba617339c2ef03d7b4f5c0f26f3ffa2e985196ffc77902a4285baf4b'
)

package () {

  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/opt/Loginized" "${pkgdir}/opt/"

  install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  icons_dir="/usr/share/icons/hicolor/256x256/apps"
  install -d "${pkgdir}/${icons_dir}"
  install -m644 "${srcdir}${icons_dir}/${pkgname}.png" "${pkgdir}${icons_dir}/${pkgname}.png"

  install -d "${pkgdir}/usr/local/bin"
  cp "${srcdir}/opt/Loginized/loginized" "${pkgdir}/usr/local/bin/loginized"
  chmod 755 "${pkgdir}/usr/local/bin/loginized"

}
