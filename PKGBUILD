# Maintainer: Justin Frank <jf.laelath@gmail.com>

pkgname=miniterm-git
# _pkgname=miniterm
pkgver=1.1.3.r0.a861663
pkgrel=2
pkgdesc="Lightweight VTE terminal emulator with colorscheme support (fork of tinyterm)"
arch=('i686' 'x86_64')
url="https://gitlab.com/laelath/miniterm"
license=('MIT')
depends=('vte3' 'glib2')
makedepends=('git')
source=('https://gitlab.com/laelath/miniterm.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
