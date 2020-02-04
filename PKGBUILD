# Maintainer: albakham <contact@geber.ga>

pkgname=utopia
pkgver=1.0.5665
pkgrel=1
pkgdesc='Client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://u.is'
license=('')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
sha256sums=('201e61663dbdd8d458e164bdd0347a9fc6dfdd937f8a42997d183eae524f7fa2')

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
