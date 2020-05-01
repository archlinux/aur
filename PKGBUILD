# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=vim-jellybeans
_name=jellybeans.vim
pkgver=1.7
pkgrel=1
pkgdesc='Colorful, dark color scheme, inspired by ir_black and twilight'
arch=('any')
url="https://github.com/nanotech/$_name"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
source=("$pkgname-$pkgver.zip::https://github.com/nanotech/$_name/archive/v$pkgver.zip")
sha256sums=('5ef05f4ce4d72de427b69e7ced9799db77421c6b3dfa8db86dc6f40bc61d00e5')

prepare() {
  head -41 "$_name-$pkgver/colors/$_name" | tail -21 | cut -b2- > LICENSE
}

package() {
  install -Dm644 "$_name-$pkgver/colors/$_name" \
    "$pkgdir/usr/share/vim/vimfiles/colors/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
