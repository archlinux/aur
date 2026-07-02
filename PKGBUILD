# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>
_pkgname=aliyunpan
pkgname="${_pkgname}-go-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc='Aliyun disk command line client, support JavaScript plug-in, support synchronous backup function.阿里云盘命令行客户端,支持webdav文件服务,支持JavaScript插件,支持同步备份功能.(Precompiled version)'
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
sha256sums_aarch64=('1551cbc318e6507a0b9e78675437b33e44e8463e89910832781ad214cf8f82c8')
sha256sums_armv7h=('01f02b2f017a3e6db6d420a8320d814c6cdaa41b0038b086373c09d0b104afec')
sha256sums_i686=('b6c4614716868e904c25087e8e7fca4b571d37a3b2143288a6abfdf06d2bd0ec')
sha256sums_x86_64=('ff97dac5d37f1d2007d9a691d535b940300efc84c5e45e5cddec81ac7ebbc947')
package() {
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/webdav.sh "${pkgdir}/usr/bin/${_pkgname}-webdav"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/sync.sh "${pkgdir}/usr/bin/${_pkgname}-sync"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/manual.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
