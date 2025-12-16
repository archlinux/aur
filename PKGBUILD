# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>

pkgname=hypopg
pkgver=1.4.2
pkgrel=1
pkgdesc="Hypothetical indexes for PostgreSQL (ask the optimizer if this hypothetical index would help)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/HypoPG/hypopg"
license=('PostgreSQL')
depends=('postgresql-libs')
makedepends=('git' 'postgresql' 'llvm')
source=("git+https://github.com/HypoPG/hypopg.git#tag=${pkgver}")
sha256sums=('76650af78d8a88931851c83474bf8215335bfca7059e17e7a7b9af73a8b5bf5a')
install='hypopg.install'

build() {
  cd hypopg
  make
}

package() {
  cd hypopg
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
