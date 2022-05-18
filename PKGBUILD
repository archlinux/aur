# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=omnisharp-vim
pkgname=$_pkgname-git
pkgver=r1779.d322a70
pkgrel=1
pkgdesc="Vim omnicompletion (intellisense) and more for C#."
arch=("any")
url="https://github.com/OmniSharp/$_pkgname"
license=("MIT")
source=("git+https://github.com/OmniSharp/$_pkgname.git")
depends=("omnisharp-roslyn")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"

  for dir in ale_linters autoload doc ftdetect ftplugin plugin syntax syntax_checkers; do
    cp -r "$srcdir/$_pkgname/$dir" "$pkgdir/usr/share/vim/vimfiles"
  done
}
