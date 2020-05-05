# Maintainer: Alec Mev <alec@mev.earth>

pkgname=zimfw-completion-git
pkgver=r29.db9c177
pkgrel=1
pkgdesc='Zsh plugin that enables and configures smart and extensive tab completion'
arch=('any')
url=https://github.com/zimfw/completion
license=('MIT')
depends=('zsh')
makedepends=('git')
source=("${pkgname}::git+https://github.com/zimfw/completion.git")
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
