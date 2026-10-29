# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=plannotator-tui
pkgname=plannotator-tui-bin
pkgver=0.9.9
pkgrel=1
pkgdesc="Annotate Markdown in the terminal: select, comment, looks-good, delete; send the review to your agent"
arch=('x86_64' 'aarch64')
url="https://github.com/plannotator/plannotator-tui"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('plannotator-tui')
conflicts=('plannotator-tui' 'plannotator-tui-git')
source=("LICENSE-v${pkgver}::https://raw.githubusercontent.com/plannotator/${_pkgname}/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-x86_64-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
source_aarch64=("${_pkgname}-aarch64-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu")
sha256sums=('5f1c1dc8da2d0456bd0ae1f6f88d75b807cdba3fe5cff3e71ec31632bd62915c')
sha256sums_x86_64=('06d403e0742b5aaf16a341ba0104f8b854f1f0ae133b70f63d11880b148d4e18')
sha256sums_aarch64=('56069a79dbf245837b723344784645aa7900bacde5c78ed27dcf6d1160837161')

package() {
  install -Dm755 "${_pkgname}-${CARCH}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
