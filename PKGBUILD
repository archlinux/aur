# Maintainer: Adam Levy <adam@aslevy.com>
pkgname=vim-jq-git
_pkgname=${pkgname%-git}
pkgver=r20.99d55a3
pkgrel=1
pkgdesc="Syntax highlighting for jq script files"
arch=('any')
url="https://github.com/vito-c/jq.vim"
depends=('vim')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/vito-c/jq.vim")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  VIMFILES=usr/share/vim/vimfiles
  install -Dm755 "$srcdir/$_pkgname/ftdetect/jq.vim" "$pkgdir/$VIMFILES/ftdetect/jq.vim"
  install -Dm755 "$srcdir/$_pkgname/syntax/jq.vim" "$pkgdir/$VIMFILES/syntax/jq.vim"
}
