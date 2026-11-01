# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=kio-stl-thumbnailer
pkgver=1.0
pkgrel=1
pkgdesc='STL thumbnails for Dolphin/KIO (software-rendered, no GL)'
arch=('x86_64')
url='https://github.com/winiciuscota/kio-stl-thumbnailer'
license=('MIT')
depends=(kio python python-numpy python-pillow)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('67d804f792e61b44b1ab1dee7ce94715bd9c94cf3e3caf9956662576b3e74d5d')

build() {
  cmake -S "$pkgname-$pkgver" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
