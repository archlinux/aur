# Maintainer: sdaqo <sdaqo.dev@protonmail.com>

pkgname=mpv-subs-popout
pkgver=0.4.0
pkgrel=1
pkgdesc="A package to enable subtitles popout feature in mpv media player with translation features."
arch=('x86_64')
url="https://github.com/sdaqo/mpv-subs-popout"

depends=('cairo>=1.10.0' 'glib2>=2.53' 'gtk3>=3.16.2' 'pango')

source=(https://github.com/sdaqo/mpv-subs-popout/releases/latest/download/mpv-subs-popout_${pkgver}_amd64.deb)

sha512sums=(
    '1fac144b56b5769ee24e6783d72426bd90513e924653eb7da2ec45db7a270102e7dc25b44487b210b9a5bf4c2557222df02f2b494c1fc1c05171686c802fb32b'   
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
