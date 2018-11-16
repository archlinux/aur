# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=hakuneko-desktop
pkgver=0.4.0
pkgrel=2
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
    'ad1939e5da894d26aa4e6252590b3eb2868937826b6091419da0f0767b655c716272a4867839d0eb2cbe23c63dfe7a5649ebbd434764f776804b29a2f0c3f9db'
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
