# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tftree-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Display your Terraform module call stack"
arch=('x86_64' 'aarch64')
url="https://github.com/busser/tftree"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tftree_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tftree_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3fcc2ad1b87eb0d9616bc624da9d5889e3608c1603258d4ca0f06a6b80ed4499')
sha256sums_aarch64=('3f24550596027b001bbec7ca3dd2608cc1e831be205470bfe8ed17cd0fc341e2')

package() {
  install -Dm755 "tftree" "${pkgdir}/usr/bin/tftree"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
