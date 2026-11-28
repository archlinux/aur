# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ndiag-bin
pkgver=0.15.5
pkgrel=1
pkgdesc="High-level architecture diagramming and documentation tool"
arch=('x86_64' 'aarch64')
url="https://github.com/k1LoW/ndiag"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/k1LoW/ndiag/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ndiag_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ndiag_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('41ac68b3620720a98a42d3e1f5f690df32cf8b4bc0039aeaa45f164883d4b765')
sha256sums_x86_64=('1c8fd63ac20bde88d06fc1d485df3c9e944ce604441dde602ab72eca33e59425')
sha256sums_aarch64=('33ff8a1107ad09d36980072ee535e88ff5d1e6c8880b35c8b969ed1e7abe0a05')

package() {
  install -Dm755 "ndiag" "${pkgdir}/usr/bin/ndiag"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
