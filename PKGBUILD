# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=noodle-rest-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="REST client where the repository is the workspace"
arch=('x86_64' 'aarch64')
url="https://github.com/noodle-rest/noodle"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'noodle-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/noodle-rest/noodle/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/noodle-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/noodle-linux-arm64")
sha256sums=('fcf353912854f70ba3768b3755a934d16b8cbc98ed183cc1e8124639b179ef01')
sha256sums_x86_64=('0e9689b7d7f6829471a3ae77a4b1d6352fb92a91bc9060c0caf7086a6409ee7a')
sha256sums_aarch64=('99c0b92f009aa456e597f62336c23398e5b1ca0003598acb8ad81ddad405d360')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/noodle"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
