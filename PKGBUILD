# Maintainer: Randy Ramos <rramos1295@gmail.com>
# Contributor: Masoud Naservand <relive.mn@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>


pkgname='neovim-jellybeans'
_name=jellybeans.vim
pkgver=1.6
pkgrel=1
pkgdesc='Colorful, dark color scheme, inspired by ir_black and twilight'
arch=('any')
url="https://github.com/nanotech/$_name"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
source=("https://github.com/nanotech/$_name/archive/v$pkgver.zip")
sha256sums=('51cf6fab89ed5566a684717276daf069e18df416c72e354c237b9d7fc7960ed2')

prepare() {
  head -56 "$_name-$pkgver/colors/$_name" | tail -24 | cut -b2- > LICENSE
}

package() {
  install -Dm644 "$_name-$pkgver/colors/$_name" \
    "$pkgdir/usr/share/nvim/runtime/colors/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

