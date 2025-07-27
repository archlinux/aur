# Maintainer: EdgeNeko Fei <hv0905@outlook.com>

pkgname=neko-upscale
_pkgname=neko-upscale
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Qt6 GUI for realesrgan-ncnn-vulkan."
arch=('x86_64')
url="https://github.com/hv0905/neko-upscale" # Replace with your actual repo URL
license=('MIT')
depends=('qt6-base' 'realesrgan-ncnn-vulkan-bin')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8f1470646d116ecc816d629966e357e3f41d70d7843192a3006273c44fc65605')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
