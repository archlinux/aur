# Maintainer: Nick <nickallbritton@proton.me>

pkgname=snick
pkgver=0.5.2
pkgrel=6
pkgdesc="Simple little snake game powered by SDL3!"
url="https://codeberg.org/genuinely-jaava/snick"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("snick")
conflicts=("snick")
source=("https://codeberg.org/genuinely-jaava/snick/archive/v$pkgver.tar.gz")
sha256sums=('4a5b78b449f6cb875c13a70e75d3743caa188905cca628e737d83b3ce74f118c')

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
