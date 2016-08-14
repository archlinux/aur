# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=way-cooler-git
pkgver=r842.24c3c08
pkgrel=1
pkgdesc="Customizeable Wayland compositor written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Immington-Industries/way-cooler"
license=('MIT')
depends=('wlc')
makedepends=('cargo' 'rust' 'git')
source=("${pkgname}::git+https://github.com/Immington-Industries/way-cooler.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  cargo install way-cooler --root "$pkgdir"
  mkdir "$pkgdir/usr"
  mv "$pkgdir/bin" "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
