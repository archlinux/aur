# Maintainer: Eraldo Bako <eraldobako@gmail.com>
pkgname=fconvert
pkgver=2.0.0
pkgrel=1
pkgdesc="A fast, intentional CLI file converter for images, audio, and video."
arch=('x86_64')
url="https://github.com/Eraldo-Bako/fconvert"
license=('MIT')
depends=('opencv' 'ffmpeg')
makedepends=('gcc')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  g++ -o fconvert main.cpp classes/*.cpp `pkg-config --cflags --libs opencv4` -lstdc++fs
}

package() {
  cd "$pkgname"
  install -Dm755 fconvert "$pkgdir/usr/bin/fconvert"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}