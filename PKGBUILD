# Maintainer: sdaqo <sdaqo.dev@protonmail.com>

pkgname=mpv-subs-popout
pkgver=0.5.2
pkgrel=1
pkgdesc="A package to enable subtitles popout feature in mpv media player with translation features."
arch=('x86_64')
url="https://github.com/sdaqo/mpv-subs-popout"

depends=('cairo>=1.10.0' 'glib2>=2.53' 'gtk3>=3.16.2' 'pango')
source=(https://github.com/sdaqo/mpv-subs-popout/releases/download/v${pkgver}/mpv-subs-popout_${pkgver}-1_amd64.deb)

sha512sums=(
    '92bcc7b85b7c4a4adb1ec3c8fe69a75054184980c111bbc8328b51f6f76663baf031705a025f626381ada45968926d4783d59658a92590fdc16d72c031e2723a'   
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
