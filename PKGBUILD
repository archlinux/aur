# Maintainer: jamazi <jamazi@tutanota.com>

pkgname=zig-completion-git
_pkgname=shell-completions
pkgver=gc5b387b
pkgrel=1
pkgdesc="Shell completions for the Zig compiler."
url="https://github.com/ziglang/shell-completions.git"
license=("MIT")
optdepends=('bash-completion: Bash completion support')
arch=("any")
source=("git+https://github.com/ziglang/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --all | sed 's/.*-//'
}

package() {
  cd "${_pkgname}"

  install -Dm644 _zig         "${pkgdir}/usr/share/zsh/site-functions/_zig"
  install -Dm644 _zig.bash    "${pkgdir}/usr/share/bash-completion/completions/_zig"
}
