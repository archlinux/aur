# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dedao-dl
pkgver=1.1.14
pkgrel=2
pkgdesc="得到APP课程下载工具,可在终端查看文章内容,可生成PDF,音频文件,markdown文稿,可下载电子书。"
arch=("x86_64")
url="https://github.com/yann0917/dedao-dl"
license=("MIT")
conflicts=("${pkgname}")
optdepends=('wkhtmltopdf: Convert to PDF'
            'ffmpeg: Audio synthesis'
            'google-chrome: Generate PDF')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-dl}-linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/yann0917/dedao-dl/main/LICENSE")
sha256sums=('38cc0fa93f1098f8a6979159d31c1dd44e98795111fff763e2bbef3a5a4a287e'
            '1ba8379d33340e518c32fe24046f7cb0530250ec193e7e3d0ea72fd558a1e926')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}