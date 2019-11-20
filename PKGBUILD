# Maintainer: albakham <contact@geber.ga>

pkgname=utopia
pkgver=1.0.5345
pkgrel=1
pkgdesc='Beta client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://beta.u.is'
license=('')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
sha256sums=('671728e169f506a8555c96afd76da21301c64c71b38dc8354fa90ed2138f4b93')

build() {

  ar -x ${srcdir}/utopia-latest.amd64.deb
  tar -xJf ${srcdir}/data.tar.xz

}

package() {
    install -d "${pkgdir}/opt/"
    cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt/"

    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "${srcdir}/opt/utopia/messenger/Utopia" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
