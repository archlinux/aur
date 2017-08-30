# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=way-cooler-bg
pkgver=0.2.1
pkgrel=1
pkgdesc="The program that draws a background for Way Cooler"
arch=('i686' 'x86_64')
url="https://github.com/Immington-Industries/way-cooler-bg"
license=('MIT')
depends=('way-cooler' 'atk' 'pango' 'gdk-pixbuf2' 'gtk3')
makedepends=('cargo' 'rust' 'git')
source=("${pkgname}::git+https://github.com/Immington-Industries/way-cooler-bg.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  cargo install way-cooler-bg --root "$pkgdir"
  mkdir "$pkgdir/usr"
  mv "$pkgdir/bin" "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
