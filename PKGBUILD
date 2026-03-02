# Maintainer: Nick <nickallbritton@proton.me>

pkgname=snick
pkgver=0.5.3
pkgrel=7
pkgdesc="Simple little snake game powered by SDL3!"
url="https://codeberg.org/genuinely-jaava/snick"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("snick")
conflicts=("snick")
source=("https://codeberg.org/genuinely-jaava/snick/archive/v$pkgver.tar.gz")
sha256sums=('ca71770d67a9e1da519e9a09faa2b34b99ef617153d5eb6ed7ade3c3bb8a40da')

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
