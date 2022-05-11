# Maintainer: Braxton Schafer <braxton@cmdcentral.xyz>

pkgname=muteme-client
pkgver=0.0.5
pkgrel=1
pkgdesc="Companion app for MuteMe button"
arch=('x86_64')
url="https://muteme.com/pages/downloads"
license=('custom')
source=(
    "https://downloads.muteme.com/download/flavor/default/${pkgver}/linux_64/${pkgname}_0${pkgver}_amd64.deb"
)
sha512sums=(
    '55caece423aac156ac7d19aafb01abff85df8f44e7254798ffc0910ccec70fc13b7e5ed113a801c59e728db28a0ab9e18599dbbc81fb71e77994d86aa546b2a7'
)

package() {
    cd "${srcdir}"

    tar -xf ${srcdir}/data.tar.xz
    install -m755 -d "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${srcdir}/usr/share/doc/${pkgname}/copyright"
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
