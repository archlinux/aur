# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agf-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Find, search and resume local AI coding agent sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/subinium/agf"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/subinium/agf/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agf-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agf-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('26b7182e9a87bcd2c752aba2ded58aafa25f766a7f8de7460184bc0f0f53b33a')
sha256sums_x86_64=('db21c06f0a288f832879828278303cafa6d8f1e967751ee7da9962a3c0c0aeeb')
sha256sums_aarch64=('671f34411c49806ccc0e9f580f0c3205f6693d8e893dc114872107c60ff2645e')

package() {
  install -Dm755 "agf" "${pkgdir}/usr/bin/agf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
