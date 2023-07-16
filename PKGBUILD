# Maintainer: sdaqo <sdaqo.dev@protonmail.com>

pkgname=mpv-subs-popout
pkgver=0.3.1
pkgrel=1
pkgdesc="A package to enable subtitles popout feature in mpv media player"
arch=('x86_64')
url="https://github.com/sdaqo/mpv-subs-popout"

depends=('cairo>=1.10.0' 'glib2>=2.53' 'gtk3>=3.16.2' 'pango')

source=(https://github.com/sdaqo/mpv-subs-popout/releases/latest/download/mpv-subs-popout_${pkgver}_amd64.deb)

sha512sums=(
    'eb753a04b9108e021596614bb7312f881e3b8fc34015b9b5da3b23671c9b2c772d99ccf468a1330132bc071086dc0115c6d2caf34383cafba83590d14b3627e4'   
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
