# Maintainer: kamisaki
# Description: A terminal wrap tool inspired by Spotify Wrapped

pkgname=terminalwrap
pkgver=1.2.0
pkgrel=1
pkgdesc="A terminal wrap tool inspired by Spotify Wrapped"
arch=('x86_64')
url="https://github.com/xeyossr/terminalwrap"
license=('GPL-3')
makedepends=('gcc' 'make' 'cmake') 
source=("https://github.com/xeyossr/terminalwrap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/terminalwrap-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/terminalwrap-$pkgver/build"
  install -Dm755 terminalwrap "$pkgdir/usr/bin/terminalwrap"
}
