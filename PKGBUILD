# Maintainer: Guilherme B. Duarte <guilhermebemberduarte@gmail.com>
pkgname=viper-bin
_pkgname=viper
pkgver=1.7.3
pkgrel=1
epoch=3
pkgdesc="Viper is a launcher and updater for Northstar, and not much more than that."
arch=('x86_64')
depends=('nss' 'alsa-lib' 'gtk3')
url="https://github.com/0neGal/${_pkgname}"
license=('GPL3')
source=("https://github.com/0neGal/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('d35d21896573881b862fb96f0c9c938d56c4aa841a467928b269d5ccaabefad3')

package() {
     tar -xf data.tar.xz -C "${pkgdir}"
     mkdir ${pkgdir}/usr/bin
     install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/viper.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/viper.png"
     rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"
     chmod 4755 "${pkgdir}/opt/Viper/chrome-sandbox"
     ln -sf /opt/Viper/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
