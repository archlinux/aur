# Maintainer: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=pipetron
pkgver=1.2.0
pkgrel=1
pkgdesc='A third-party daemon to fix Electron audio streams naming conflicts in PipeWire.'
arch=('x86_64')
url='https://codeberg.org/ponleou/pipetron'
license=('MIT')
depends=('pipewire' 'tomlplusplus')
makedepends=('meson' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/ponleou/pipetron/archive/v$pkgver.tar.gz")
sha256sums=('1be88bce13cd7ade14f61cdafbd023c102dfa82d7ee04b2e9a2c83a78df24e5c')
install=pipetron.install

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
