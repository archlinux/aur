# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spettro-bin
pkgver=2.8.4
pkgrel=1
pkgdesc="Terminal coding assistant with multi-agent workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/Aploide/spettro"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Aploide/spettro/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/spettro_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/spettro_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('e2f00eb09d40b293cedfdb5fce1d02bdc498f9f1c733f0030064eb8356776069')
sha256sums_aarch64=('f4bcfca61d108012e8e6ff495cfe77de0a770b5a007bd5367dfedaeca98a46df')

package() {
  install -Dm755 "spettro" "${pkgdir}/usr/bin/spettro"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
