# Maintainer: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=pipetron
pkgver=1.0.1
pkgrel=3
pkgdesc='Electron node manager for PipeWire'
arch=('x86_64')
url='https://codeberg.org/ponleou/pipetron'
license=('MIT')
depends=('pipewire')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/ponleou/pipetron/archive/v$pkgver.tar.gz")
sha256sums=('005f12df057b8a4bed2c3dc710bb31292a642df7e994ac273a192ac0260ef63d')
install=pipetron.install

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
