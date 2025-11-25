# Maintainer: Henrique Mayer <hmayer@gmail.com>

pkgname=zsh-thefuck-git
pkgver=r6.136b5a2
pkgrel=2
pkgdesc="ZSH plugin. Initialize thefuck with cache support"
arch=("any")
url="https://github.com/laggardkernel/zsh-thefuck"
license=('MIT')
depends=('thefuck' 'zsh')
makedepends=('git')
provides=('zsh-thefuck')
conflicts=('zsh-thefuck')
source=("git+https://github.com/laggardkernel/zsh-thefuck.git")
sha512sums=('SKIP')
install=".install"

pkgver() {
  cd "zsh-thefuck/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/zsh-thefuck"
  install -Dm 755 "init.zsh" "${pkgdir}/usr/share/zsh/plugins/${pkgname}/init.zsh"
  install -Dm 755 "zsh-thefuck.plugin.zsh" "${pkgdir}/usr/share/zsh/plugins/${pkgname}/zsh-thefuck.plugin.zsh"
  install -Dm 744 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

