# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="music-dl-bin"
pkgver=3.2.3
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
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('3a7ed721bdf11f824412dfa1d48a2305aac8fc7b8ed0f795e1c4a3c7e9679ee1'
            '57d9689723f779c562e62ddb5f5f4393fbf41b16bd677096c9623c82a0d4aa19')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}