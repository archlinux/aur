# Maintainer: aksr <aksr at t-com dot me>
pkgname=vim-tomorrow-theme-git
pkgver=v1.0.r20.g5d66e71
pkgrel=1
pkgdesc="Tomorrow Theme for Vim"
arch=('any')
url="https://github.com/chriskempson/vim-tomorrow-theme"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=()
#conflicts=('vim-colorsamplerpack')
replaces=()
backup=()
options=()
install=""
source=("$pkgname::git+https://github.com/chriskempson/vim-tomorrow-theme.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname/colors"
  install -Dm644 Tomorrow.vim $pkgdir/usr/share/vim/vimfiles/colors/Tomorrow.vim
  install -Dm644 Tomorrow-Night.vim $pkgdir/usr/share/vim/vimfiles/colors/Tomorrow-Night.vim
  install -Dm644 Tomorrow-Night-Blue.vim $pkgdir/usr/share/vim/vimfiles/colors/Tomorrow-Night-Blue.vim
  install -Dm644 Tomorrow-Night-Bright.vim $pkgdir/usr/share/vim/vimfiles/colors/Tomorrow-Night-Bright.vim
  install -Dm644 Tomorrow-Night-Eighties.vim $pkgdir/usr/share/vim/vimfiles/colors/Tomorrow-Night-Eighties.vim
}

