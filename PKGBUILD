# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vide_cli-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Agentic terminal UI for Claude for Flutter developers"
arch=('x86_64')
url="https://github.com/Norbert515/vide_cli"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Norbert515/vide_cli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/vide-linux-x64")
sha256sums=('5435a7a08c02dca0459e11eb4c4e47d165577b179b1e6dac09e03fec0cdfb014')
sha256sums_x86_64=('a8dfea349f1f0f286cfdcf553c05afb76ca9886cba1ce7cfd3298d11f5158b94')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/vide"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
