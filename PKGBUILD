# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=hakuneko-desktop
pkgver=0.4.0
pkgrel=1
pkgdesc="Electron based Manga Downloader for Linux, Windows & MacOS. Also known as HakuNeko-S."
arch=('x86_64')
url="https://sourceforge.net/projects/hakuneko"
license=('MIT')
depends=('libxss' 'gconf' 'nss' 'alsa-lib' 'gtk2' 'libxtst')
source_x86_64=(
    "https://downloads.sourceforge.net/project/hakuneko/${pkgver}/${pkgname}_${pkgver}_linux_amd64.deb"
    "${pkgname}.sh"
)
sha512sums_x86_64=(
    'eba7e31f514e9b4d932cb6acc74f691ba2a6477af73f37ed8008755cd70c28740968ae7693a3abf743378156d25b7eb7f264a8ef54d9ca81479e572aba3092cd'
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
