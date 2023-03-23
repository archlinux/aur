# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dedao-dl
pkgver=1.1.12
pkgrel=1
pkgdesc="得到APP课程下载工具,可在终端查看文章内容,可生成PDF,音频文件,markdown文稿,可下载电子书。"
arch=("x86_64")
url="https://github.com/yann0917/dedao-dl"
license=(MIT)
depends=()
optdepends=('wkhtmltopdf: Convert to PDF'
            'ffmpeg: Audio synthesis'
            'google-chrome: Generate PDF')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/dedao-linux-amd64"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('ede38aa12b4c6b54607b8f2cde61fa1f2e766b9724db94e9a5d4dc731258e636'
            'eb2a58a7939a835a1fc414ceac07c08352337f3467d81723811b88e9659780f5')
      
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
