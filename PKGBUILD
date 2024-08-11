# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>
_pkgname=aliyunpan
pkgname="${_pkgname}-go-bin"
pkgver=0.3.3
pkgrel=1
pkgdesc='阿里云盘命令行客户端，支持webdav文件服务，支持JavaScript插件，支持同步备份功能。(Precompiled version)'
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url='https://github.com/tickstep/aliyunpan'
license=('Apache-2.0')
depends=('bash')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-armv7.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.zip")
sha256sums_aarch64=('26e504c7bd1ea528d7590d22e995ab4839a6f2642bfcca53c1b728b0b2602e88')
sha256sums_armv7h=('7099eb8e5a376c540cda36c1ce7de4311d2c340312d053f1520a00aa66f804ac')
sha256sums_i686=('335589756483cbeb8587f9cb2150213632f11fc20e4fe63257c79e605ebf1fe3')
sha256sums_x86_64=('2476a5c9e5ed34a98d544e6f0234af03fd1fc6145242af928205fcdc19670f43')
package() {
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/webdav.sh "${pkgdir}/usr/bin/${_pkgname}-webdav"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/sync.sh "${pkgdir}/usr/bin/${_pkgname}-sync"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/manual.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}