# Maintainer: Cristofer528yt <cristofer528yt@github.com>
pkgname=video2ascii
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert videos to ASCII art in terminal with 30fps 150x75 resolution"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/cristofer528yt/video2ascii"
license=('MIT')
depends=('opencv')
makedepends=('gcc' 'git')
source=("git+https://github.com/cristofer528yt/video2ascii.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  chmod +x compile.sh
  ./compile.sh
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 video2ascii "$pkgdir/usr/bin/video2ascii"
  install -Dm644 video2ascii.cpp "$pkgdir/usr/share/video2ascii/video2ascii.cpp"
  install -Dm644 compile.sh "$pkgdir/usr/share/video2ascii/compile.sh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/video2ascii/README.md"
}
