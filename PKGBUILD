# Maintainer: albakham <contact@geber.ga>

pkgname=utopia
pkgver=0.3.5115
pkgrel=1
pkgdesc='Beta client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://beta.u.is'
license=('')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
sha256sums=('deaa353a9c792b9504ffc6f80ac230487f0a3c72a193a48e8d7edbf9515be45d')

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
