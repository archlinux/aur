# Maintainer: Frank Krick frank.krick@gmail.com
pkgname=wlavu-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Wayland-based PipeWire VU-meter"
arch=('x86_64')
url=https://git.sr.ht/~kennylevinsen/wlavu
depends=('pipewire' 'wayland-protocols' 'wayland')
source=('https://git.sr.ht/~kennylevinsen/wlavu')
md5sums=('SKIP')

build() {
  cd wlavu
  meson setup build --prefix /usr --optimization 3 --builtype release
  cd build
  meson compile
}

package() {
  cd wlavu/build
  meson install --destdir "$pkgdir"
}
