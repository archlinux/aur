# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dnvm-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Install and update .NET SDKs"
arch=('x86_64' 'aarch64')
url="https://github.com/dn-vm/dnvm"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dn-vm/dnvm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dnvm-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dnvm-${pkgver}-linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('ab37dd892712c6aa531525f0e9407aa613dd756efefa97497b44f801a1f2d9ed')
sha256sums_aarch64=('9f5e56c3a29fbbfb93b32d312832da44647043b0d4fd453ed5e2743df3c351ce')

package() {
  install -Dm755 "dnvm" "${pkgdir}/usr/bin/dnvm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
