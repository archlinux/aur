# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-dl-bin
pkgver=5.2.3
pkgrel=1
pkgdesc="Music Searcher and Downloader.音乐搜索下载器。"
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
sha256sums=('6f23c811e71e7c0b9c834e0b411a6c3a29e7ae23edbb31e8de2a5558b07d0e18'
            'c808ccc6389e810d0ad90d9f25e148b0a344f6be110704928d73ab95be5b62e9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}