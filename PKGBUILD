# Maintainer: cargabsj175 <cargabsj175@gmail.com>
pkgname=neonatox-stopwatch
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple gtk 4 stopwatch."
arch=('i686' 'x86_64')
url="https://github.com/cargabsj175/neonatox-stopwatch"
license=('GPL-3.0-or-later')
depends=('gtk4')
makedepends=('git' 'meson')

source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  # Si es necesario aplicar parches o hacer ajustes antes de compilar, se hace aquí.
}

build() {
  cd "$pkgname"
  meson setup --prefix=/usr --buildtype=release builddir
  meson compile -C builddir
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" meson install -C builddir
}
