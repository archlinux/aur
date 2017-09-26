# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gpuvis-git
pkgver=r859.5b8f4bc
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://github.com/mikesart/gpuvis"
license=('MIT')
source=("git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"/gpuvis
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/gpuvis
  make
}

package() {
  cd "$srcdir"/gpuvis
  install -dm755 "$pkgdir/usr/bin/"
  install -m755 _release/gpuvis "$pkgdir/usr/bin/"
}
