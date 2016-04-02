# Maintainer: 
pkgname="asf"
pkgver="2.0.1.9"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=(any)
url="https://github.com/JustArchi/ArchiSteamFarm"
license=('Apache')
depends=('mono')
backup=('opt/asf/config/ASF.json')
install=${pkgname}.install
source=("https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF.zip"
        "${pkgname}.sh"
        "${pkgname}-gui.sh"
        "${pkgname}.service")
sha256sums=('094bb5b2de5f9310a9f04b98f47e4366343bb7fb59711c1db2b61a960f488299'
            'a5d0324c029efb1f99264e787fea26ad53953b4df59bf642bca1ffabad4027f5'
            'bae7acbddf28bef784521456dc64989a1772ddd875926781ea02b28df7dd0609'
            'afeee8eb3f1bafa1b0502ce6be43e5119ab73fdc228a49990c9087462c5464af')

package() {
    install -d -m 755 "${pkgdir}/opt/${pkgname}"
    cp -dpr --no-preserve=ownership *.exe config "${pkgdir}/opt/${pkgname}"

    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 "${srcdir}/${pkgname}-gui.sh" "${pkgdir}/usr/bin/${pkgname}-gui"
    install -D -m 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

