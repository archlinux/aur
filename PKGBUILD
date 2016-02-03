# Maintainer: aksr <aksr at t-com dot me>
pkgname=vim-tomorrow-theme-git
pkgver=1.0.r24.gf45a2ca
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
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname/colors"
  for i in *.vim; do
    install -Dm644 $i $pkgdir/usr/share/vim/vimfiles/colors/$i
  done
}

