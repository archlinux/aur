# Maintainer: Jeremy 'Ichimonji10' Audet <ichimonji10 at gmail dot com>

pkgname='vim-hemisu-git'
_repository='vim-hemisu'
pkgver=v3.4.4.g37ea6aa # see pkgver()
pkgrel=1
pkgdesc='A color scheme with dark and light variants, by Noah Frederick.'
arch=('any')
url="https://github.com/noahfrederick/${_repository}.git"
license=('CCPL:cc-by-nc-3.0')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/noahfrederick/${_repository}.git")

md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_repository"
  git describe --always | sed 's/-/./g'
}

package() {
  install -Dm 644 \
    "$srcdir/$_repository/colors/hemisu.vim" \
    "$pkgdir/usr/share/vim/vimfiles/colors/hemisu.vim"
}

# vim:set ts=2 sw=2 et:
