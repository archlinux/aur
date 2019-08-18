# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=hakuneko-desktop
pkgver=5.0.8
pkgrel=1
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
    '733086c5d693ee6d8bc7fe6a9ac68d6752c2dcb51fbe26c107860e89d014b589a2f5d311d5e2058b27d569ac7805cce40fe519d6729d2a78cee53c20ae523243'
    '18c99d1f4f0d2cb889e5e3ec541c26842bd128af68018780d3d43bcd147e0b9cf99260f9c79f506b383f9d9946c3f92577a6c71ea647b1ea7936f4031e628601'
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
