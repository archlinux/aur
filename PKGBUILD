# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=etchdns-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="DNS proxy with WebAssembly plugins"
arch=('x86_64')
url="https://github.com/DNSCrypt/EtchDNS"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/etchdns-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('a1689d8ec1f190eb3c75e6b8317426a98eea649dfbc03e8e62a207f9c2aa52a9')

package() {
  install -Dm755 "etchdns-${pkgver}-linux-x86_64/etchdns" "${pkgdir}/usr/bin/etchdns"
  install -Dm644 "etchdns-${pkgver}-linux-x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "etchdns-${pkgver}-linux-x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
