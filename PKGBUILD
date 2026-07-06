# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=valuate
pkgver=1.1.0
pkgrel=1
pkgdesc="A GTK3, XApp and Cinnamon-rebased calculator fork"
arch=('x86_64')
url="https://github.com/Twilight0/valuate"
license=('GPL3')
depends=('gtk3' 'libhandy' 'xapp' 'gtksourceview4' 'libsoup3' 'libgee' 'libmpc' 'mpfr')
makedepends=('vala' 'meson' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  arch-meson "valuate-$pkgver" build
  meson compile -C build
}

package() {
  cd "$srcdir/build"
  meson install --destdir "$pkgdir"
}
