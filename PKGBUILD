# Maintainer: albakham <contact@geber.ga>
# Co-Maintainer: danvj <geral@danvj.pt>

pkgname=utopia
pkgver=1.3.66
pkgrel=1
pkgdesc='Client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://u.is'
license=('')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
depends=(libx11 libglvnd libpulse fontconfig)
optdepends=(gst-plugins-base gst-plugins-ugly gst-plugins-good gst-plugins-bad)
sha256sums=('ed5551e691c352c266bd13bf0860552d36eaa85d527f3a87380f79c8b16ad2e2')

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
