# Maintainer: jamazi <jamazi@tutanota.com>

pkgname=zig-completion-git
_pkgname=shell-completions
pkgver=r18.c2983a7
pkgrel=1
pkgdesc="Shell completions for the Zig compiler."
url="https://codeberg.org/ziglang/shell-completions"
license=("MIT")
arch=("any")
makedepends=("git")
optdepends=('bash-completion: Bash completion support'
            'zsh: Zsh completion support')
provides=("zig-completion")
conflicts=("zig-completion")
source=("git+https://codeberg.org/ziglang/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  install -Dm644 _zig      "${pkgdir}/usr/share/zsh/site-functions/_zig"
  install -Dm644 _zig.bash "${pkgdir}/usr/share/bash-completion/completions/zig"
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
