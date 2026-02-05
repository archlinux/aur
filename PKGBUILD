# Maintainer: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=pipetron
pkgver=1.1.0
pkgrel=1
pkgdesc='Electron node manager for PipeWire'
arch=('x86_64')
url='https://codeberg.org/ponleou/pipetron'
license=('MIT')
depends=('pipewire')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/ponleou/pipetron/archive/v$pkgver.tar.gz")
sha256sums=('d82d31c02b7423c919cafc443d0393e952bb2219f51bb3d2d5446d8a46ad3586')
install=pipetron.install

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
