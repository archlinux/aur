# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui-bin"
_pkgname="customfetch"
pkgver=0.10.0
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (With GUI mode) (Binary files)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('GPL3')
#depends=() # some of them are in the "base" meta-package anyway so basically no extra depends
conflicts=('customfetch-gui-git' 'customfetch-gui' 'customfetch-git' 'customfetch-bin')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-gui-v${pkgver}.tar.gz"
        "${url}/raw/main/cufetch.desktop")
sha256sums=("71dbd4fa38d758cfe91a2ccab53994b224f027ef9a1adcf938b56c7c861eae0b"
            "SKIP")

package() {
    cd "${srcdir}/"
    install -Dm755 "cufetch" "${pkgdir}/usr/bin/cufetch"
    install -Dm644 "cufetch.1" "${pkgdir}/usr/share/man/man1/cufetch.1"
    install -Dm644 "cufetch.desktop" "${pkgdir}/usr/share/applications/cufetch.desktop"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd assets/ && find ascii/ -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/customfetch/{}" \;
}
