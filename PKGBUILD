# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="music-dl-bin"
pkgver=3.3.2
pkgrel=1
pkgdesc="Music Searcher and Downloader. - 音乐搜索下载器。"
arch=("x86_64")
url="https://github.com/guanguans/music-dl"
license=('MIT')
depends=('php')
provides=("guanguans")
conflicts=("${pkgname%-bin}")
noextract=()
options=(!strip)
source=("${pkgname%-bin}-${pkgver}::https://github.com/guanguans/music-dl/raw/master/builds/music-dl"
    "LICENSE::https://raw.githubusercontent.com/guanguans/music-dl/master/LICENSE")
sha256sums=('59e77c8448c5c3b180f86ecdbc67bac6b4ca6ed1fdaad4df073f8e8ea1bcd8b0'
            '57d9689723f779c562e62ddb5f5f4393fbf41b16bd677096c9623c82a0d4aa19')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}