# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=perch-tui-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Jump back into recent Claude Code and Codex projects from a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/baoyudu/perch"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'perch-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/perch_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/perch_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('de6878cc70ab954e4036b731a697019b7738099975ad2cb1e88c07ee2406f1f9')
sha256sums_aarch64=('907beab3ce38a4df4a40dae596f0967226300d32452ea4fd0021f79ac0b16a63')

package() {
  install -Dm755 "perch" "${pkgdir}/usr/bin/perch"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
