# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-dl-bin
pkgver=7.1.0
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
sha256sums=('4c5b078f1308ce9f553a9dabbc844052d99b520daa05cb1a923b424d9e3dc1f1'
            '0555f0b36779138f072188a96b1700161ceeac6f55d3b6cc56c410b3e6b0be7c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
