# Maintainer: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=pipetron
pkgver=1.0.0
pkgrel=2
pkgdesc='Electron node manager for PipeWire'
arch=('x86_64')
url='https://codeberg.org/ponleou/pipetron'
license=('MIT')
depends=('pipewire')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/ponleou/pipetron/archive/v$pkgver.tar.gz")
sha256sums=('77d435c9fb736176c73c6d7bf7be937240ccbd37f4861541428459e1e476ca5c')
install=pipetron.install

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
