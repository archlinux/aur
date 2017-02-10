# Maintainer: Amos Onn <https://aur.archlinux.org/account/amosonn>

pkgname=vim-racer-git
_pkgname=vim-racer
pkgver=r148.34f806e
pkgrel=1
pkgdesc='Vim plugin for using Racer for Rust code completion and navigation.'
arch=('any')
url='https://github.com/racer-rust/vim-racer'
license=('none')
depends=('vim>=7.3' 'rust-racer')
provides=('vim-racer')
replaces=('vim-racer')
groups=('vim-plugins')
install=vimdoc.install
source=("git+https://github.com/racer-rust/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"ftplugin/rust_racer.vim"
  install -D -m644 {,"$_vimdir/"}"rplugin/python3/deoplete/sources/racer.py"
  install -D -m644 {,"$_vimdir/"}"syntax/rustdoc.vim"
  install -D -m644 {,"$_vimdir/"}"autoload/racer.vim"
}
