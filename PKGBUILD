# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rundler-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="ERC-4337 bundler in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemyplatform/rundler"
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/alchemyplatform/rundler/v${pkgver}/COPYING")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rundler-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rundler-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b9d9baf7ee145976aab5c392e3e6de16d6aae2e9126a0b20b10a0acab3d75240')
sha256sums_aarch64=('3c00812dfc10770d3b7e9ca946e8678927664b65a130a4e47c796380471cfb43')

package() {
  install -Dm755 "rundler" "${pkgdir}/usr/bin/rundler"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
