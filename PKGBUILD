# Maintainer: watasuke <watasuke102@gmail.com>

pkgname=zen-object-viewer
pkgver=0.1.0
pkgrel=1
pkgdesc='STL object viewer for the Zen 3D compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/zwin-project/zen-object-viewer'
license=('MIT')
depends=('zukou' 'gcc-libs' 'glibc')
makedepends=('meson' 'glm' 'libglvnd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b1c091d81c2783c1df8028ee646b4d6dc96b472d24069df858756d97816a918')

build() {
  arch-meson "$pkgname-$pkgver" build -Dwerror=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
