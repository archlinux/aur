# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-dl-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="Music Searcher and Downloader.Prebuilt version.音乐搜索下载器."
arch=("x86_64")
url="https://github.com/guanguans/music-dl"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'php>=8.1'
)
source=(
    "${pkgname%-bin}-${pkgver}::https://github.com/guanguans/music-dl/raw/${pkgver}/builds/music-dl"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/guanguans/music-dl/${pkgver}/LICENSE"
)
sha256sums=('abd1b7504af22a02e9506a7d59ea25c460bae4a3a2a1d6d76cdde6dd4587c8f6'
            'c808ccc6389e810d0ad90d9f25e148b0a344f6be110704928d73ab95be5b62e9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}