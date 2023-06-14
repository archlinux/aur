# Maintainer: Braxton Schafer <braxton@cmdcentral.xyz>

pkgname=muteme-client
pkgver=0.0.7
pkgrel=1
pkgdesc="Companion app for MuteMe button"
arch=('x86_64')
url="https://muteme.com/pages/downloads"
license=('custom')
source=(
    "https://downloads.muteme.com/download/flavor/default/${pkgver}/linux_64/${pkgname}_${pkgver}_amd64-NoSandbox.deb"
)
sha512sums=(
    '6c2013958ccc62e6d18760556fe21652c5e414a739a9f36c6619c9fe0bebd2cfd551c6096a0d6bbd9bc1dda8a47d250ae443cf6957024aef4829515316e3f5ed'
)

package() {
    cd "${srcdir}"

    tar -xf ${srcdir}/data.tar.xz
    install -m755 -d "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${srcdir}/usr/share/doc/${pkgname}/copyright"
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
