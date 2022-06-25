# Maintainer: Guilherme B. Duarte <guilhermebemberduarte@gmail.com>
pkgname=viper-bin
_pkgname=viper
pkgver=1.6.0
pkgrel=1
epoch=3
pkgdesc="Viper is a launcher and updater for Northstar, and not much more than that."
arch=('x86_64')
depends=('nss' 'alsa-lib' 'gtk3')
url="https://github.com/0neGal/${_pkgname}"
license=('GPL3')
source=("https://github.com/0neGal/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b129ad50c4a3701b6d37be1886fab47b245a1a314715b2ee7b14af1487d9f617')

package() {
	 tar -xf data.tar.xz -C "${pkgdir}"
	 mkdir ${pkgdir}/usr/bin
     install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/viper.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/viper.png"
     rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"
     chmod 4755 "${pkgdir}/opt/Viper/chrome-sandbox"
     ln -sf /opt/Viper/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
