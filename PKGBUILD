# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sidecar-bin
pkgver=1.17.1
pkgrel=1
pkgdesc="Diffs, file trees, history and tasks next to your CLI coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/marcus/sidecar"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/marcus/sidecar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sidecar_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sidecar_${pkgver}_linux_arm64.tar.gz")
sha256sums=('e7a3e9a3051ab2804b2fb9a1471a47489b78c44b7688274210a3a977779828aa')
sha256sums_x86_64=('f0122d00e1e991eaeb4a7547893da805932d85393213b4be180ef717a23ea0e8')
sha256sums_aarch64=('f1f9630d52ec02df47fe25f5ff21dfeaffbe6512bc3aaba6e674c98fa841fa9e')

package() {
  install -Dm755 "sidecar" "${pkgdir}/usr/bin/sidecar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
