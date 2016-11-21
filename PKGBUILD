pkgname=vim-rust
pkgver=r353.905de98
pkgrel=1
pkgdesc="Vim configuration for Rust."
arch=('any')
url="https://github.com/rust-lang/rust.vim"
license=('apache' 'mit')
groups=('vim-plugins')
depends=('vim')
install=vimdoc.install
source=("git+https://github.com/rust-lang/rust.vim.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/rust.vim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/rust.vim"
  local installpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 syntax_checkers/rust/rustc.vim "$installpath/syntax_checkers/rust/rustc.vim"
  install -Dm644 syntax/rust.vim "$installpath/syntax/rust.vim"
  install -Dm644 plugin/rust.vim "$installpath/plugin/rust.vim"
  install -Dm644 indent/rust.vim "$installpath/indent/rust.vim"
  install -Dm644 ftplugin/rust.vim "$installpath/ftplugin/rust.vim"
  install -Dm644 ftdetect/rust.vim "$installpath/ftdetect/rust.vim"
  install -Dm644 doc/rust.txt "$installpath/doc/rust.txt"
  install -Dm644 compiler/rustc.vim "$installpath/compiler/rustc.vim"
  install -Dm644 compiler/cargo.vim "$installpath/compiler/cargo.vim"
  install -Dm644 autoload/rustfmt.vim "$installpath/autoload/rustfmt.vim"
  install -Dm644 autoload/rust.vim "$installpath/autoload/rust.vim"
  install -Dm644 after/syntax/rust.vim "$installpath/after/syntax/rust.vim"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
