# Maintainer: kamisaki
# Description: A terminal wrap tool inspired by Spotify Wrapped


pkgname=terminalwrap
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal wrap tool inspired by Spotify Wrapped"
arch=('x86_64')
url="https://github.com/xeyossr/terminalwrap"
license=('GPL-3')
depends=('gcc' 'make')
source=("git+https://github.com/xeyossr/terminalwrap.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/terminalwrap"
  g++ -O3 -march=native -flto -funroll-loops -ftree-vectorize -std=c++17 -o terminalwrap terminalwrap.cpp
}

package() {
  cd "$srcdir/terminalwrap"
  install -Dm755 dist/terminalwrap "$pkgdir/usr/bin/terminalwrap"
}
