# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gmult
pkgver=10.0
pkgrel=1
pkgdesc="Multiplication Puzzle is a simple game inspired by the multiplication game inside the popular editor emacs"
arch=('x86_64')
url="https://git.launchpad.net/gmult"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz)
md5sums=('4033ee6fdf20b628c412d4d555610a1e')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
