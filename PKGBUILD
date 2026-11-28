# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=conntracct-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Low-overhead real-time network traffic monitoring with eBPF and conntrack"
arch=('x86_64')
url="https://github.com/ti-mo/conntracct"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/conntracct_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('18e8b24343d7655083c3964bb349c7c62f13021b327583fd972c38566128a727')

package() {
  install -Dm755 "conntracct" "${pkgdir}/usr/bin/conntracct"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
