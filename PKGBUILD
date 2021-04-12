# Maintainer: albakham <contact@geber.ga>

pkgname=utopia
pkgver=1.0.7338
pkgrel=1
pkgdesc='Client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://u.is'
license=('')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
depends=(libx11 libglvnd libpulse fontconfig)
optdepends=(gst-plugins-base gst-plugins-ugly gst-plugins-good gst-plugins-bad)

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
md5sums=('eaad66ed16e3117303a46617e8242aa2')
sha512sums=('6da7c66392aed7e9f9890a4209cd99615566a6c316704ff7c35e3b7df6978e518ca6b57a41018c72e67967af651be1e122278f239cef16ee4c813acf914d6f2e')
b2sums=('6c581a8b4a0acb2561f54cc2be9427ee7bbd5eabed07641391ff2ced98d2dc286a4678dcff8f87829b1839176f3b534c511c550ee6c43052b1c0e494bc30b784')
