# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dedao
pkgname="${_pkgname}-dl-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="得到APP课程下载工具,可在终端查看文章内容,可生成PDF,音频文件,markdown文稿,可下载电子书。"
arch=("x86_64")
url="https://github.com/yann0917/dedao-dl"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
optdepends=('wkhtmltopdf: Convert to PDF'
            'ffmpeg: Audio synthesis'
            'google-chrome: Generate PDF')
source=("${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/yann0917/dedao-dl/v${pkgver}/LICENSE")
sha256sums=('28c3edf421f2f7895d58c3d8593f51b8ef2ebd2df83facda87fd1ffdc829d16c'
            '1ba8379d33340e518c32fe24046f7cb0530250ec193e7e3d0ea72fd558a1e926')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}