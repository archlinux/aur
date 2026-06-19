# Maintainer: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=pipetron
pkgver=1.2.1
pkgrel=1
pkgdesc='A third-party daemon to fix Electron audio streams naming conflicts in PipeWire.'
arch=('x86_64')
url='https://codeberg.org/ponleou/pipetron'
license=('MIT')
depends=('pipewire' 'tomlplusplus')
makedepends=('meson' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/ponleou/pipetron/archive/v$pkgver.tar.gz")
sha256sums=('aa23e49aadc3281d5fc4c465d017c0d362d84a5832979644d212eb6a083f3da6')

install=pipetron.install

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
