# Maintainer: sdaqo <sdaqo.dev@protonmail.com>

pkgname=mpv-subs-popout
pkgver=0.5.0
pkgrel=1
pkgdesc="A package to enable subtitles popout feature in mpv media player with translation features."
arch=('x86_64')
url="https://github.com/sdaqo/mpv-subs-popout"

depends=('cairo>=1.10.0' 'glib2>=2.53' 'gtk3>=3.16.2' 'pango')
source=(https://github.com/sdaqo/mpv-subs-popout/releases/download/v${pkgver}/mpv-subs-popout_${pkgver}-1_amd64.deb)

sha512sums=(
    '3d19c1a97590176267f59023ae33306389bee45d04b5ed055cb7c3c05e16920713b0bb5795b3298f28c6bd41ebc69ad62bdc053115c280661df9a2ec83c52277'   
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
