# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>
_pkgname=aliyunpan
pkgname="${_pkgname}-go-bin"
pkgver=0.3.9
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
sha256sums_aarch64=('67e040e9f5fb8420a4a338f256c907876fa7d73b1eb680341595a8fe05b975c6')
sha256sums_armv7h=('5c365eac19642e68ba097f539948a179236fac8db217e2e3ec00ab549ef170ce')
sha256sums_i686=('e0b7480ee8845f8590630dac6a9c17951a59dedcc6bb5acecc35d7fc26fd01d5')
sha256sums_x86_64=('4653c1d79d7e156e275162481ac71f3e6f6b1c72b604c4b663a8a17fb2b361d7')
package() {
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/webdav.sh "${pkgdir}/usr/bin/${_pkgname}-webdav"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/sync.sh "${pkgdir}/usr/bin/${_pkgname}-sync"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/manual.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
