# Maintainer: Justin Frank <justinpfrank@protonmail.com>

pkgname=miniterm-git
_pkgname=miniterm
pkgver=v1.2.0.0.gc4d2ae2
pkgrel=1
pkgdesc="Lightweight VTE terminal emulator with colorscheme support (fork of tinyterm)"
arch=('i386' 'x86_64')
url="https://github.com/laelath/miniterm"
license=('MIT')
depends=('vte3' 'glib2')
makedepends=('git')
source=('git+https://github.com/laelath/miniterm.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed 's/-/./g'
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
