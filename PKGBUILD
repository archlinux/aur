# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bpfsnoop-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Trace kernel functions, tracepoints and BPF programs"
arch=('x86_64')
url="https://github.com/bpfsnoop/bpfsnoop"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bpfsnoop/bpfsnoop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bpfsnoop-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('03ad516922d0d0e284c3ab1cd4334a8eac6d6004113f11adc54b41aa4c5ef4f5')

package() {
  install -Dm755 "bpfsnoop" "${pkgdir}/usr/bin/bpfsnoop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
