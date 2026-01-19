# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dedao
pkgname="${_pkgname}-dl-bin"
pkgver=1.2.14
pkgrel=1
pkgdesc="Get app course download tool, you can view article content in terminal, generate PDF, audio file, markdown manuscript, download e-book from DeDao.com.(Written in GO.Prebuilt version)得到APP课程下载工具,可在终端查看文章内容,可生成PDF,音频文件,markdown文稿,可下载电子书。"
arch=('x86_64')
url="https://github.com/yann0917/dedao-dl"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
optdepends=(
    'wkhtmltopdf: Convert to PDF'
    'ffmpeg: Audio synthesis'
    'google-chrome: Generate PDF'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/yann0917/dedao-dl/v${pkgver}/LICENSE"
)
sha256sums=('b4c71099d1eb59b393cac0f413c677db521506cd5edc2b9e795dc67f6439d9e9'
            '1ba8379d33340e518c32fe24046f7cb0530250ec193e7e3d0ea72fd558a1e926')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
