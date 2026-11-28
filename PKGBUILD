# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kakehashi-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Language server that bridges languages, editors and tooling"
arch=('x86_64' 'aarch64')
url="https://github.com/atusy/kakehashi"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/atusy/kakehashi/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kakehashi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kakehashi-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('6c7f8ff2cecd75e6163a58553386de1bf14ae1f8c3d5420eef024b1e6711d603')
sha256sums_x86_64=('47d40b166f3987442a9c624ffa3d50537b7b7b94a23a67cd663857f32da63ed0')
sha256sums_aarch64=('c6850eb295438380386f711ca851ed9a747310e3e6773d3c60b35c794e9baf34')

package() {
  install -Dm755 "kakehashi" "${pkgdir}/usr/bin/kakehashi"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
