# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=snoop-ebpf-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Syscall tracer built on eBPF"
arch=('x86_64' 'aarch64')
url="https://github.com/pandaadir05/snoop"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'snoop')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pandaadir05/snoop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/snoop-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/snoop-aarch64-linux.tar.gz")
sha256sums=('1601532ca8493a3e57bb77398a38663a56e4cfc4d0da8c05d04bfdf4267b8918')
sha256sums_x86_64=('3a22670bfb2ab1710598a27df078cb3b4c595915d1507bc78164a2ac294dc069')
sha256sums_aarch64=('f0d978658c0d35cddfdc0dc2698c02d37b986bd66224a52e86e7ba68a5fcda8d')

package() {
  install -Dm755 "snoop" "${pkgdir}/usr/bin/snoop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
