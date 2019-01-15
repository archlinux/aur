# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-rainbow-parentheses-improved
pkgver=3.3.1
pkgrel=1
pkgdesc="Better Rainbow Parentheses (Improved)"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/luochen1990/rainbow"
license=('custom:vim')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('079c08998757f61503450be716fd0328803b81985e25fcdc8a6f0f44d49f8457')

package() {
  cd rainbow-$pkgver
  install -dm 756 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in plugin # autoload
  do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
