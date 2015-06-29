# Maintainer: aksr <aksr at t-com dot me>
pkgname=vim-molokai-git
pkgver=r43.db8ce13
pkgrel=1
epoch=
pkgdesc="Port of the TextMate's monokai colorscheme for Vim."
arch=('any')
url="https://github.com/tomasr/molokai"
license=('unknown')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('vim-molokai')
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=vim-molokai-git.install
source=("$pkgname::git+https://github.com/tomasr/molokai.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname/colors"
  install -Dm644 molokai.vim $pkgdir/usr/share/vim/vimfiles/colors/molokai.vim
}

