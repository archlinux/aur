# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudflarespeedtest-bin
_appname=CloudflareST
pkgver=2.2.4
pkgrel=2
pkgdesc="自选优选IP测试Cloudflare CDN延迟和速度,获取最快IP(IPv4/IPv6)!另外也支持其他CDN/网站 IP"
arch=('x86_64')
url="https://github.com/XIU2/CloudflareSpeedTest"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('sh')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux_amd64.tar.gz")
sha256sums=('cb9899ca526f3a7ff5fc0de745aa9a863ea8a36953abe1b50f9754c65101b3c8')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/${pkgname%-bin}"
    mv "${pkgdir}/opt/${pkgname%-bin}/使用+错误+反馈说明.txt" "${pkgdir}/opt/${pkgname%-bin}/ReadMe.txt"
    ln -sf "${pkgdir}/opt/${pkgname%-bin}/cfst_hosts.sh" "${pkgdir}/usr/bin/cfst_hosts"
    ln -sf "${pkgdir}/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}