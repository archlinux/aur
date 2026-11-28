# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ddns-watchdog-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Dynamic DNS client for DNSPod, AliDNS, Cloudflare and Huawei Cloud"
arch=('x86_64' 'aarch64')
url="https://github.com/y1jiong/ddns-watchdog"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/ddns-watchdog-client-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/ddns-watchdog-client-${pkgver}-linux-arm64.tar.xz")
sha256sums_x86_64=('52e9c7bf78896f0a341624dbf51af66f2a0eb825726af67079d2ab3d52973201')
sha256sums_aarch64=('9b8d12c12495cbe261fc672e3da85963ffffddc2c115538ebd4c7b98dba43cba')

package() {
  install -Dm755 "ddns-watchdog-client" "${pkgdir}/usr/bin/ddns-watchdog-client"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
