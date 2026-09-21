# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-dl-bin
pkgver=7.1.4
pkgrel=1
pkgdesc="Music Searcher and Downloader.音乐搜索下载器."
arch=('x86_64')
url="https://guanguans.github.io/music-dl"
_ghurl="https://github.com/guanguans/music-dl"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'php>=8.1'
)
source=(
    "${pkgname%-bin}-${pkgver}::${_ghurl}/blob/${pkgver}/builds/music-dl"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/guanguans/music-dl/${pkgver}/LICENSE"
)
sha256sums=('b6ce92e62b674e803af242bb3af211af11552ef0e41eead566074baf6612b567'
            '0555f0b36779138f072188a96b1700161ceeac6f55d3b6cc56c410b3e6b0be7c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
