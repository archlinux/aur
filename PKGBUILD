# Maintainer:  Althorion <althorion@protonmail.com>

pkgname=bliss-rust-git
_gitname=bliss
pkgver=0.1.3
pkgrel=1
pkgdesc="Batteries included .gitignore management tool"
arch=('x86_64')
url="https://github.com/ajmwagar/bliss"
license=('MIT')
depends=('git')
makedepends=('rust')
source=('git://github.com/ajmwagar/bliss')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_gitname"

  cargo build --release
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 755 "target/release/$_gitname" "$pkgdir/usr/bin/$_gitname"
}

# vim:set ts=2 sw=2 et:
