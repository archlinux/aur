# Maintainer: albakham <contact@geber.ga>

pkgname=utopia
pkgver=1.0.7058
pkgrel=2
pkgdesc='Client for Utopia, an "Anti Orwellian Ecosystem"'
arch=('x86_64')
url='https://u.is'
license=('')
source=(https://update.u.is/downloads/linux/utopia-latest.amd64.deb)
#sha256sums=('bc8541ce96c9c422e5e357b5d1f006f8585b3d8b3c0cf31b480a2aa6741169e5')
#sha512sums=('ee1cb1cde665c383680db0c090372198a7bb71f7f61431c9b328e96adbc1739b623e774a2ad044cdbc50225d26532ee6dab72c2b0ba6a42ff8099162e39e7c97')
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
md5sums=('925b54557686b1597ea1fc1c9a130fc2')
sha512sums=('a303b38fb7bb90370ed9add4d30cc7900ceec7e750f119f9ee7fbc8984a4c46e837d8bb70345bf513a5f16b23400644ac8311618bb5d899923b57847d120498f')
b2sums=('13fe599c81e8289398d942cb7f586829e7fe255f08fbb3282d1e81949109e133cf7890eb40a0e6c1d6f5991d3ccc0c626fa2f450aa4ea29d68e353eecc3a7627')
