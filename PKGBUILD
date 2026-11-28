# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gebug-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Debug Dockerized Go applications"
arch=('x86_64' 'aarch64')
url="https://github.com/moshebe/gebug"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gebug_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gebug_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('d206656e7961d82e601044f1ecb7b6df4895d9cd5cd54a58522af4f1e55dcb6b')
sha256sums_aarch64=('7416843d50a5feba71dcb2f1b34c84889c3888737316b31455220b2546f29303')

package() {
  install -Dm755 "gebug" "${pkgdir}/usr/bin/gebug"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
