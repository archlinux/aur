# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=hakuneko-desktop
pkgver=0.3.1
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
    'aa7089f6e536251ab2358b9df9615b2a1068109cb8a3cf2d373102f77065af551d19314551f2f25ed2527262dcdad58f56045b8b73b2f1ea650a94b392cccf78'
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
