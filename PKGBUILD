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
sha256sums=('76a41ec26d29f1120145eab304fed071de84e0be42c7b14ee3458fee1682513d')

build() {
  arch-meson "valuate-$pkgver" build
  meson compile -C build
}

package() {
  cd "$srcdir/build"
  meson install --destdir "$pkgdir"
}
