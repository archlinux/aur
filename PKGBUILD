# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prevail-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="eBPF verifier based on abstract interpretation"
arch=('x86_64')
url="https://github.com/vbpf/prevail"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/prevail-Linux-X64.tar.gz")
sha256sums_x86_64=('fbdce7faa7cf1af1ac5fea606de4bb315fb8c4495fb6673ab01ef7d08c517ef5')

package() {
  install -Dm755 "prevail" "${pkgdir}/usr/bin/prevail"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-Apache-2.0.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
