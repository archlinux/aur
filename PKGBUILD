# Maintainer: watasuke <watasuke102@gmail.com>

pkgname=zukou
pkgver=0.1.2
pkgrel=1
pkgdesc='Client library for Zwin'
arch=('x86_64' 'aarch64')
url='https://github.com/zwin-project/zukou'
license=('MIT')
depends=('wayland' 'glm' 'libglvnd' 'gcc-libs' 'glibc')
makedepends=('meson' 'zwin-protocols' 'libjpeg-turbo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac7f5365ab972f0cd1b64699b9a331ac57b7e604f17e521ac3921e5741d99828')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
