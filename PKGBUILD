# Maintainer: Joseph Lyncheski <directmusic94@gmail.com>
pkgname=simple-sc
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple PipeWire screen recording utility for Linux"
arch=('x86_64')
url="https://github.com/directmusic/simple-sc"
license=('MIT')
depends=('libpipewire' 'dbus' 'ffmpeg')
makedepends=('base-devel' 'cmake' 'libpipewire' 'dbus' 'libportal' 'ffmpeg')
provides=("$pkgname")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cmake -S "$srcdir/$pkgname" -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 build/simple-sc "$pkgdir/usr/bin/simple-sc"
}
