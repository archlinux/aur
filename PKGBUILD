# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazytrivy-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="TUI for Trivy vulnerability scanning"
arch=('x86_64' 'aarch64')
url="https://github.com/owenrumney/lazytrivy"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/owenrumney/lazytrivy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/lazytrivy-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/lazytrivy-linux-arm64")
sha256sums=('2b254cb4d9ffc0206152d3448f7782af2cc71faee98f3aaeebfa21b8ca1af243')
sha256sums_x86_64=('1a5ea163145ef816da9f6d95471ee8eb43ca16e089de132da9fc844519a7129e')
sha256sums_aarch64=('db4f3b640399e0764c8353646868d446bd744b104606b9672cb57fdd2e7c800a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lazytrivy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
