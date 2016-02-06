# Maintainer: Masoud Naservand <relive.mn@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>


pkgname='neovim-jellybeans'
_name=jellybeans.vim
pkgver=1.5
pkgrel=1
pkgdesc='Colorful, dark color scheme, inspired by ir_black and twilight'
arch=('any')
url="https://github.com/nanotech/$_name"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
source=("https://github.com/nanotech/$_name/archive/v$pkgver.zip")
sha256sums=('f4399b3230ca52b966e1a99370b38420dd2b0db02dac8c8606b43b00850603ed')

prepare() {
  head -41 "$_name-$pkgver/colors/$_name" | tail -21 | cut -b2- > LICENSE
}

package() {
  install -Dm644 "$_name-$pkgver/colors/$_name" \
    "$pkgdir/usr/share/nvim/runtime/colors/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
