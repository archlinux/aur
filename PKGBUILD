# Maintainer: Masoud Naservand <relive.mn@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Randy Ramos <rramos1295@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>


pkgname='neovim-jellybeans'
_pkgname=jellybeans.vim
pkgver=1.7
pkgrel=2
pkgdesc='Colorful, dark color scheme, inspired by ir_black and twilight'
arch=('any')
url="https://github.com/nanotech/$_pkgname"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
source=("https://github.com/nanotech/$_pkgname/archive/v$pkgver.zip")
sha256sums=('5ef05f4ce4d72de427b69e7ced9799db77421c6b3dfa8db86dc6f40bc61d00e5')

prepare() {
  head -56 "$_pkgname-$pkgver/colors/$_pkgname" | tail -24 | cut -b2- > LICENSE
}

package() {
  install -Dm644 "$_pkgname-$pkgver/colors/$_pkgname" \
    "$pkgdir/usr/share/nvim/runtime/colors/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_pkgname-$pkgver/README.markdown" \
    "$pkgdir/usr/share/doc/neovim-jellybeans/README.markdown"
  install -Dm644 "$_pkgname-$pkgver/ansi-term-colors.txt" \
    "$pkgdir/usr/share/doc/neovim-jellybeans/ansi-term-colors.txt"

}

