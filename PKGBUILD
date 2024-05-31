# Maintainer: sdaqo <sdaqo.dev@protonmail.com>

pkgname=mpv-subs-popout
pkgver=0.5.1
pkgrel=1
pkgdesc="A package to enable subtitles popout feature in mpv media player with translation features."
arch=('x86_64')
url="https://github.com/sdaqo/mpv-subs-popout"

depends=('cairo>=1.10.0' 'glib2>=2.53' 'gtk3>=3.16.2' 'pango')
source=(https://github.com/sdaqo/mpv-subs-popout/releases/download/v${pkgver}/mpv-subs-popout_${pkgver}-1_amd64.deb)

sha512sums=(
    'e788dbe6635ea748928fa23253d96da7336b91671781b57c8e78a202ba833a74975eede78bbc8e8091b0840260e6098b3152f3351c00ac440d8e416150de81b5'   
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
