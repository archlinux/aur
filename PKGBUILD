# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: thorwithpizza
# Maintainer: relrel <relrelbachar at gmail dot com>
# Contributor: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>
# Contributor: Kirill Klenov <horneds at gmail dot com>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid na gmail com>

pkgname=vim-kotlin-git
pkgver=r86.e043f6a
pkgrel=2
pkgdesc='Vim plugin for syntax, highlighting, basic indentation, and Syntastic support'
arch=('any')
license=('Apache')
url='https://github.com/udalov/kotlin-vim'
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'kotlin')
makedepends=('git')
provides=("${pkgname%-git}" 'kotlin-vim' 'neovim-kotlin')
conflicts=("${pkgname%-git}" 'kotlin-vim' 'neovim-kotlin')
replaces=('kotlin-vim' 'neovim-kotlin')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find ftdetect ftplugin indent syntax syntax_checkers \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 tw=100 et:
