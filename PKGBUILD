# Maintainer Shell Chen <aur@sorz.org>
pkgname=pgvector
pkgver=0.8.0
pkgrel=2
pkgdesc="A vector similarity search extension for PostgreSQL"
arch=('x86_64' 'i686')
url='https://github.com/pgvector/pgvector'
license=('custom')
depends=('postgresql')
makedepends=('llvm' 'clang')
optdepends=()
source=("https://github.com/pgvector/pgvector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('867a2c328d4928a5a9d6f052cd3bc78c7d60228a9b914ad32aa3db88e9de27b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make OPTFLAGS=""
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

