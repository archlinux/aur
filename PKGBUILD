# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=peanut-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Deploy databases and services for development and testing pipelines"
arch=('x86_64' 'aarch64')
url="https://github.com/Clivern/Peanut"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/peanut_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/peanut_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('d1e8cf0493642e9b35d338928a2b249b22ad346bf9b0649f49b3aee328478163')
sha256sums_aarch64=('4c6b1d67989eed30620df40faa809bc6cb5c5797594e7709aa23b8e11d8a4193')

package() {
  install -Dm755 "peanut" "${pkgdir}/usr/bin/peanut"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
