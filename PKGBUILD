# Contributor: Vorzard <vorzard at plexomat dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=vim-base16-git
pkgver=0.r59.1ce4b84
pkgrel=1
pkgdesc="Base16 for Vim"
arch=('any')
url="https://github.com/chriskempson/base16-vim"
license=('unknown')
groups=(vim-plugins)
depends=('vim')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=vim-base16-git.install
source=("$pkgname::git+https://github.com/chriskempson/base16-vim.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname/colors"
  mkdir -p $pkgdir/usr/share/vim/vimfiles/colors/
  install -D -m644 *.vim $pkgdir/usr/share/vim/vimfiles/colors/
}

