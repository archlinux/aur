# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=rasterizer
pkgver=0.1
pkgrel=1
pkgdesc='Small program that draws random lines like it was 1987'
arch=('x86_64' 'i686')
url="https://github.com/xyproto/rasterizer"
license=('GPL')
makedepends=('go' 'go-sdl')
depends=('sdl')
source=("https://raw.github.com/xyproto/rasterizer/master/$pkgname.go")
sha256sums=('a36c824ce488aaf9af74139df90efba4d48d6bfbee536ea64156c664cfbb7bfa')

build() {
  cd "$srcdir"

  go build -o "$pkgname"
}

package() {
  cd "$srcdir"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
