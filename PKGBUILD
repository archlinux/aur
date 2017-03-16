# $Id: PKGBUILD 170484 2016-04-11 16:26:46Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=vim-airline-themes
pkgver=r1230.793ce66
pkgrel=1
pkgdesc='Themes for vim-airline'
arch=('any')
url='https://github.com/vim-airline/vim-airline-themes'
license=('MIT')
makedepends=('git')
groups=('vim-plugins')
source=("git+https://github.com/vim-airline/$pkgname.git#commit=${pkgver#*.}")
md5sums=('SKIP')

#prepare() {
#  cd "$pkgname"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

package() {
  cd "$pkgname"

  _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -d "$_installpath"
  cp -r autoload plugin "$_installpath"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
