# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=coven-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Local-first runtime and TUI for running Codex, Claude Code"
arch=('x86_64')
url="https://github.com/OpenCoven/coven"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/OpenCoven/coven/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/coven-v${pkgver}-linux-x64.tar.gz")
sha256sums=('8d7f1b6fc46dad4f5cb473e2fb4dc010a3236c731cb24f5f89bdfbab5c321a35')
sha256sums_x86_64=('60c329e1f598794c17324804b50f6981a50f925ef1d9696624db828fce014128')

package() {
  install -Dm755 "coven" "${pkgdir}/usr/bin/coven"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
