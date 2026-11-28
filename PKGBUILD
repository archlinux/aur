# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-avahi-cname-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Publish mDNS subdomains for your machine"
arch=('x86_64' 'aarch64')
url="https://github.com/grishy/go-avahi-cname"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-avahi-cname_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-avahi-cname_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ad0ade4394e01b1e4feb6969f0120327871fee50b85b67531c697d56eaedb4f4')
sha256sums_aarch64=('52b2054a04b709b592b2a897c2409d046778d3e4355257b2ed89ef71f87e3ff3')

package() {
  install -Dm755 "go-avahi-cname" "${pkgdir}/usr/bin/go-avahi-cname"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
