# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=infinite-storage-glitch
pkgver=1.0.0
pkgrel=2
pkgdesc="Lets you embed files into video and upload them to youtube as storage."
url="https://github.com/DvorakDwarf/Infinite-Storage-Glitch"
license=("GPL3")
depends=(opencv)
makedepends=(git rust clang)
optdepends=(	'ffmpeg'
		'qt5-base')
arch=('any')
source=(git+https://github.com/DvorakDwarf/Infinite-Storage-Glitch.git)
sha256sums=('SKIP')

build() {
   cd "$srcdir/Infinite-Storage-Glitch"
   cargo build --release
}

package() {
  cd "$srcdir/Infinite-Storage-Glitch"
  install -Dm755 "target/release/isg_4real" -t "$pkgdir/usr/bin/"
}
