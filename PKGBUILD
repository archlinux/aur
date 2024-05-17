# Maintainer: sdaqo <sdaqo.dev@protonmail.com>

pkgname=mpv-subs-popout
pkgver=0.4.3
pkgrel=1
pkgdesc="A package to enable subtitles popout feature in mpv media player with translation features."
arch=('x86_64')
url="https://github.com/sdaqo/mpv-subs-popout"

depends=('cairo>=1.10.0' 'glib2>=2.53' 'gtk3>=3.16.2' 'pango')
source=(https://github.com/sdaqo/mpv-subs-popout/releases/download/v${pkgver}/mpv-subs-popout_${pkgver}-1_amd64.deb)

sha512sums=(
    'c60b320bab3574dc1ee76b01389d762244edc27208864b30698f9734ec8321cdc1756392a9ff3faa776963dcde03e8ffd47468c3d46bd9637568afa931a6ddc3'   
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
