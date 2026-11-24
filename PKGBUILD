# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-code-statusline-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Status line for Claude Code showing model, git and usage details"
arch=('x86_64')
url="https://github.com/glauberlima/claude-code-statusline"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/glauberlima/claude-code-statusline/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/statusline-linux-x64")
sha256sums=('d923589f245a7e802901fce0967009eb11b5fc92cd5f74eac1edf9c866c498cf')
sha256sums_x86_64=('81a8f73b2cbc4302d1c8321d7967253e1123751bdef175c542811795ee6b214e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/statusline"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
