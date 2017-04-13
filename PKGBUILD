# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=rhythmbox-plugin-tray-icon-git
_pkgname=rhythmbox-tray-icon
pkgver=93.38275a7
pkgrel=2
pkgdesc="Tray icon for Rhythmbox 2.9+ with rating feature"
arch=("any")
url="https://github.com/mendhak/rhythmbox-tray-icon"
license=("GPL3")
source=("git+https://github.com/mendhak/rhythmbox-tray-icon.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 tray_icon.plugin "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}/tray_icon.plugin"
  install -Dm644 tray_icon.py "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}/tray_icon.py"
  install -Dm644 tray_playing.png "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}/tray_playing.png"
  install -Dm644 tray_stopped.png "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}/tray_stopped.png"
}
