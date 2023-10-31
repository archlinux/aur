# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=viper-bin
_pkgname=viper
pkgver=1.9.0
pkgrel=1
epoch=3
pkgdesc="Viper is a launcher and updater for Northstar, and not much more than that."
arch=('x86_64')
depends=('nss' 'alsa-lib' 'gtk3')
url="https://github.com/0neGal/${_pkgname}"
license=('GPL3')
source=("https://github.com/0neGal/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('7200bb5631f739c61c5903c875d0d693983817adc354f4e2cc81ef34100510ef')

package() {
     tar -xf data.tar.xz -C "${pkgdir}"
     mkdir ${pkgdir}/usr/bin
     install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/viper.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/viper.png"
     rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"
     chmod 4755 "${pkgdir}/opt/Viper/chrome-sandbox"
     ln -sf /opt/Viper/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
