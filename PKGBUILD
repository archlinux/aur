# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="cloudflarespeedtest-bin"
pkgver=2.2.3
pkgrel=1
pkgdesc="自选优选IP测试Cloudflare CDN延迟和速度,获取最快IP(IPv4/IPv6)!另外也支持其他CDN/网站 IP"
arch=('x86_64')
url="https://github.com/XIU2/CloudflareSpeedTest"
license=("GPL3")
conflicts=("${pkgname%-bin}")
depends=('sh')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/CloudflareST_linux_amd64.tar.gz")
sha256sums=('e87d31250921be87a03df67222f1465dda5ca92a81ef43550b2137504bf7e397')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/${pkgname%-bin}"
    mv "${pkgdir}/opt/${pkgname%-bin}/使用+错误+反馈说明.txt" "${pkgdir}/opt/${pkgname%-bin}/ReadMe.txt"
    mv "${pkgdir}/opt/${pkgname%-bin}/注意 2.1.0 版本移除了 -ipv6 参数.txt" "${pkgdir}/opt/${pkgname%-bin}/Notice.txt"
    ln -sf "${pkgdir}/opt/${pkgname%-bin}/cfst_hosts.sh" "${pkgdir}/usr/bin/cfst_hosts"
    ln -sf "${pkgdir}/opt/${pkgname%-bin}/CloudflareST" "${pkgdir}/usr/bin/CloudflareST"
}