# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=way-cooler
pkgver=0.3
pkgrel=1
epoch=1
pkgdesc="Customizeable Wayland compositor written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Immington-Industries/way-cooler"
license=('MIT')
depends=('wlc')
makedepends=('cargo' 'rust' 'git')
source=("${pkgname}::git+https://github.com/Immington-Industries/way-cooler.git#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  rm Cargo.lock
}

package() {
  cd "$srcdir/$pkgname"
  cargo install way-cooler --root "$pkgdir"
  mkdir "$pkgdir/usr"
  mv "$pkgdir/bin" "$pkgdir/usr"

  mkdir -p "$pkgdir/etc/way-cooler"
  cp "$srcdir/$pkgname/config/init.lua" "$pkgdir/etc/way-cooler"
}

# vim:set ts=2 sw=2 et:
