# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=hakuneko-desktop
pkgver=6.1.7
pkgrel=2
pkgdesc="Manga & Anime Downloader for Linux, Windows & MacOS"
arch=('x86_64')
url="https://github.com/manga-download/hakuneko"
license=('MIT')
depends=('libxss' 'nss' 'gtk3')
source=(
    "https://github.com/manga-download/hakuneko/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.deb"
    "${pkgname}.sh"
)
sha512sums=(
    '356204665e745f1bde45c1612b6f780174780ce2bcd8d5abe3b0ca9322ee696c3ab3404dd90b924a6f2d30daf563146582fda539aca229a8c7f4e40df2f1c406'
    '4dc0f7c10d0567bda1cd7a8547f4ec6008f5926fb7b01bfcf3c25a758bb081a91ba787b51fb5bef34d5f68c5243817b65205a48aa6882410945292f2220cff0b'
)

package() {
    cd "${srcdir}"

    tar -xf ${srcdir}/data.tar.xz
    install -m755 -d "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${srcdir}/usr/share/doc/${pkgname}/copyright"
    cp -r "${srcdir}/usr/" "${pkgdir}"
    install -Dm755 "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
