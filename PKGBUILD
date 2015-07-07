# Maintainer: Jeremy 'Ichimonji10' Audet <ichimonji10 at gmail dot com>

pkgname='vim-jellybeans-git'
_repository='jellybeans.vim'
pkgver=v1.5.29.gf931895 # see pkgver()
pkgrel=1
pkgdesc='A colorful, dark color scheme, inspired by ir_black and twilight.'
arch=('any')
url="https://github.com/nanotech/$_repository"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/nanotech/${_repository}.git" 'LICENSE.txt')

sha256sums=('SKIP'
            '914e3a036fe21cf2741e5334263ea10ec145ae894248bb95c8cb9e38f20baabf')

pkgver() {
  cd "$_repository"
  git describe --always | sed 's/-/./g'
}

package() {
  cd "$srcdir"
  install -Dm 644 \
    "$_repository/colors/jellybeans.vim" \
    "$pkgdir/usr/share/vim/vimfiles/colors/jellybeans.vim"
  install -Dm 644 \
    "LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
