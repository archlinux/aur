# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=wlr-protocols-git
pkgver=r105.4264185
pkgrel=1
pkgdesc='Wayland protocols designed for use in wlroots (and other compositors).'
arch=('any')
url="https://gitlab.freedesktop.org/wlroots/wlr-protocols"
license=('MIT')
depends=()
makedepends=('git' 'wayland')
provides=('wlr-protocols')
source=("$pkgname::git+https://gitlab.freedesktop.org/wlroots/wlr-protocols")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
}
