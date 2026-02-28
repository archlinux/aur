# Maintainer: Nick <nickallbritton@proton.me>

pkgname=snick
pkgver=0.5.1
pkgrel=5
pkgdesc="Simple little snake game powered by SDL3!"
url="https://codeberg.org/genuinely-jaava/snick"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("snick")
conflicts=("snick")
source=("https://codeberg.org/genuinely-jaava/snick/archive/v$pkgver.tar.gz")
sha256sums=('75e86073bdaccb232ae210adf4e2ce682a37e361bb298c50704937fbdd8804df')

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
