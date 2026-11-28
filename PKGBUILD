# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=screeps-launcher-bin
pkgver=1.17.0
pkgrel=1
pkgdesc="Launcher for Screeps private servers"
arch=('x86_64' 'aarch64')
url="https://github.com/screepers/screeps-launcher"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/screepers/screeps-launcher/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/screeps-launcher_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/screeps-launcher_linux_arm64")
sha256sums=('699a6248bc7531798278ca3168f865df733a6be3ff3a49a903ddca883d92098e')
sha256sums_x86_64=('d665eadcafad02e8424062ee8cbc45f2e5180c845c526cf700c5f7075a01d5d9')
sha256sums_aarch64=('2ef7b1c35f917dca615a6fdf8ac5fcd44e01f9e47b69d51f12c2eb57081296af')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/screeps-launcher"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
