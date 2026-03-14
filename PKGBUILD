# Maintainer: Nick <nickallbritton@proton.me>

pkgname=snick
pkgver=0.6.1
pkgrel=11
pkgdesc="Simple little snake game powered by SDL3!"
url="https://codeberg.org/genuinely-jaava/snick"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("snick")
conflicts=("snick")
source=("https://codeberg.org/genuinely-jaava/snick/archive/v$pkgver.tar.gz")
sha256sums=('21cafb7da6b5b6776457111e8529ebcc4189c7db58d578624d93c22056c81557')

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
