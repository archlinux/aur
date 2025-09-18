# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-dl-bin
pkgver=6.3.0
pkgrel=1
pkgdesc="Music Searcher and Downloader(Prebuilt version).音乐搜索下载器."
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
sha256sums=('d5a6b91d260816b09d0cf1f04f4d8a4ad3abeb71afc09cb9fc97c13b43dca0a8'
            '074569ef9beb52388eb74729b41e633ee79b1be19a7d84d3ed76b1ae121c2873')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
