pkgname=me2png
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform, lightweight, and simple program for PNGtubing."
arch=('x86_64')
url="https://github.com/tinarskii/me2png"
license=('MIT')
depends=('raylib' 'portaudio')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tinarskii/me2png/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -S "$pkgname-$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
