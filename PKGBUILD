# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>
_pkgname=aliyunpan
pkgname="${_pkgname}-go-bin"
pkgver=0.3.2
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
sha256sums_aarch64=('12057b251eec876812acf24c3c0ed67a66a098143966c856e5823ef31c23a857')
sha256sums_armv7h=('c6afd815fad7ff352fc3260d3725cb76f578f474159ad297ba5537f32a201bbf')
sha256sums_i686=('7ea2d652d0dc8acf9c7df83b365e558505c217646c3b0fd1025de4925844746f')
sha256sums_x86_64=('ad67ae27aeb512a1689c2501309ecffac52272e7330b2eeabe043fb9f178c925')
package() {
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/webdav.sh "${pkgdir}/usr/bin/${_pkgname}-webdav"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/sync.sh "${pkgdir}/usr/bin/${_pkgname}-sync"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/manual.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}