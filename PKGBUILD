# Maintainer: albakham <contact@geber.ga>
# Co-Maintainer: danvj <geral@danvj.pt>

pkgname=utopia
pkgver=1.3.984
pkgrel=1
pkgdesc='Client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://u.is'
license=('other')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
depends=(libx11 libglvnd libpulse fontconfig)
optdepends=(gst-plugins-base gst-plugins-ugly gst-plugins-good gst-plugins-bad)
sha256sums=('088d1f827f3bfb9fe3ff29b8a6bee3af91faa8a60fb511451a67c701c6d345a2')

build() {
  ar -x ${srcdir}/utopia-latest.amd64.deb
  tar -xJf ${srcdir}/data.tar.xz
}

package() {
  install -d "${pkgdir}/opt/"
  cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt/"
  install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/opt/utopia/messenger/utopia" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
