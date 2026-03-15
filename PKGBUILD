# Maintainer: Nick <nickallbritton@proton.me>

pkgname=snick
pkgver=0.6.2
pkgrel=12
pkgdesc="Simple little snake game powered by SDL3!"
url="https://codeberg.org/genuinely-jaava/snick"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("snick")
conflicts=("snick")
source=("https://codeberg.org/genuinely-jaava/snick/archive/v$pkgver.tar.gz")
sha256sums=('4350297976c0fa80ca7771cafdc7f88f1587bbc899e19d8cf1348330be3992bc')

build() {
  cd $pkgname/
  zig build -Doptimize=ReleaseFast --summary all
}

package() {
  cd $pkgname/

  install -Dm755 zig-out/bin/snick -t "$pkgdir/usr/bin"

  rm -fr zig-out
  rm -fr .zig-cache
}
