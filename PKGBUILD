# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-dl-bin
pkgver=6.5.2
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
    "${pkgname%-bin}-${pkgver}::https://github.com/guanguans/music-dl/blob/${pkgver}/builds/music-dl"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/guanguans/music-dl/${pkgver}/LICENSE"
)
sha256sums=('e1bbd6104466e2c0ceb11b12799ed7a57b25acf6b3de2c45d3b147fbc0067861'
            '074569ef9beb52388eb74729b41e633ee79b1be19a7d84d3ed76b1ae121c2873')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
