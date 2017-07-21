# Maintainer: Giuseppe Crino <giuscri@gmail.com>
pkgname=vim-wwdc17-theme-git
pkgdesc="Colorful light color scheme for Vim inspired by Apple's WWDC17 page"
pkgrel=1
pkgver=v1.0.0.r20.gad0bf69
arch=('any')
url="https://github.com/lifepillar/vim-wwdc17-theme"
license=('unknown')
md5sums=('SKIP')
makedepends=('git')
_pkgname=vim-wwdc17-theme
source=("git+https://github.com/lifepillar/vim-wwdc17-theme.git")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 colors/wwdc17.vim "$pkgdir/usr/share/vim/vimfiles/colors/wwdc17.vim"
}

# vim:set ts=2 sw=2 et:
