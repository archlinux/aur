# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-stress-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="HTTP, gRPC and WebSocket load testing tool"
arch=('x86_64' 'aarch64')
url="https://github.com/kamalyes/go-stress"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kamalyes/go-stress/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/go-stress-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/go-stress-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('19f11382ed7fdb445b35316d269753d535e3f9ae0f79b0f1edcd83f752587328')
sha256sums_aarch64=('242c837b974dc67933941035c1c533709ff9121d66f6f4990fe6bb5c14f27168')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/go-stress"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
