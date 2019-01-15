# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-rainbow-parentheses-improved-git
pkgver=3.3.1+43.gd7bb89e6a6
pkgrel=1
pkgdesc="Better Rainbow Parentheses (Improved) (git version)"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/luochen1990/rainbow"
license=('custom:vim')
source=("git+$url")
sha256sums=('SKIP')
provides=('vim-rainbow-parentheses-improved')
conflicts=('vim-rainbow-parentheses-improved')

pkgver() {
  cd rainbow
  git describe --tags --always --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

package() {
  cd rainbow
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in plugin autoload
  do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
