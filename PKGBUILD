# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=vim-airline-themes
pkgver=r1321.3bfe1d0
# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
pkgrel=1
pkgdesc='Themes for vim-airline'
arch=(any)
url='https://github.com/vim-airline/vim-airline-themes'
license=(MIT)
groups=(vim-plugins)
makedepends=(git)
source=("git+https://github.com/vim-airline/$pkgname#commit=${pkgver#*.}")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -d "$_installpath"
  cp -r autoload plugin "$_installpath"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
