# Maintainer: sdaqo <sdaqo.dev@protonmail.com>

pkgname=mpv-subs-popout
pkgver=0.4.1
pkgrel=1
pkgdesc="A package to enable subtitles popout feature in mpv media player with translation features."
arch=('x86_64')
url="https://github.com/sdaqo/mpv-subs-popout"

depends=('cairo>=1.10.0' 'glib2>=2.53' 'gtk3>=3.16.2' 'pango')

source=(https://github.com/sdaqo/mpv-subs-popout/releases/latest/download/mpv-subs-popout_${pkgver}_amd64.deb)

sha512sums=(
    '248e5788e13ad92792694b60efa08b99d2fc46471f1a42529d2b9497fa271b421a55f44232f220512ea33f1fdce45de2403bc05c7dcf9e5baa7e1591bcd9bdc0'   
)

package() {
    cd "${srcdir}"

    tar -xf ${srcdir}/data.tar.xz
    install -m755 -d "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${srcdir}/usr/share/doc/${pkgname}/copyright"
    cp -r "${srcdir}/usr/" "${pkgdir}"
    install -Dm755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
