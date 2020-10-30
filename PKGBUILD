# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=secret
pkgver=0.11
pkgrel=4
pkgdesc="A tiny secret store to keep your little secrets"
arch=('x86_64')
url="https://github.com/angt/secret"
license=('BSD')
depends=()
makedepends=('git')
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m0755 -s "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
