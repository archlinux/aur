# Maintainer: Alec Mev <alec@mev.earth>

pkgname=zimfw-input-git
pkgver=r26.e043c8e
pkgrel=1
pkgdesc='Zsh plugin that applies correct bindkeys for input events'
arch=('any')
url=https://github.com/zimfw/input
license=('MIT')
depends=('zsh')
makedepends=('git')
source=("${pkgname}::git+https://github.com/zimfw/input.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "`git rev-list --count HEAD`" "`git rev-parse --short HEAD`"
}

package() {
  cd "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/zsh/plugins/${pkgname::-4}" init.zsh
}
