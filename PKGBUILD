# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=api-linter-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Linter for APIs defined in protocol buffers"
arch=('x86_64' 'aarch64')
url="https://github.com/googleapis/api-linter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/googleapis/api-linter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/api-linter-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/api-linter-${pkgver}-linux-arm64.tar.gz")
sha256sums=('b1d2870f1a00e4d7f56576e5f0870cba109e041f8af66866cf5b499478e654e7')
sha256sums_x86_64=('adf6b94b01bf1d82723feb2790109b69fc74af65f9be334e418dcc9b9d9ddd03')
sha256sums_aarch64=('1fe17f676a8d69bc6cebb95e4e7f523ca39979451599c2c5c495081a210d3a7f')

package() {
  install -Dm755 "api-linter" "${pkgdir}/usr/bin/api-linter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
