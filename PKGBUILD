# Maintainer: albakham <contact@geber.ga>

pkgname=utopia
pkgver=1.0.5434
pkgrel=1
pkgdesc='Client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://u.is'
license=('')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
sha256sums=('670d7ab9548c8ff0094e3e350ec34e62ccda12e92082e04f56a7d187dd021ce5')

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
