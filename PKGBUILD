# Maintainer: Justin Frank <jf.laelath@gmail.com>

pkgname=miniterm-git
_pkgname=miniterm
pkgver=v1.0.r0.gf22fb06
pkgrel=1
pkgdesc="Lightweight VTE terminal emulator with colorscheme support (fork of tinyterm)"
arch=('i686' 'x86_64')
url="https://github.com/laelath/miniterm"
license=('MIT')
depends=('vte3')
makedepends=('git')
source=('git://github.com/laelath/miniterm.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
