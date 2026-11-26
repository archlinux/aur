# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clarinet-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="Write, test and deploy smart contracts for the Stacks blockchain"
arch=('x86_64' 'aarch64')
url="https://github.com/stx-labs/clarinet"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/stx-labs/clarinet/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clarinet-linux-x64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clarinet-linux-arm64-musl.tar.gz")
sha256sums=('b98fbb37db5b23bc5cfdcd16793206a5a7120a7b01f75374e5e0888376e4691c')
sha256sums_x86_64=('7f8697b7e001e0a5c9c60753a765847c6a3c09ffdc7a21b1cc4b273d9f0d915d')
sha256sums_aarch64=('b234ced05ca7195603b061467cbfd25f29c93c8b33d522e7c25a68ad23e6dbdd')

package() {
  install -Dm755 "clarinet" "${pkgdir}/usr/bin/clarinet"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
