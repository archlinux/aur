# Maintainer Shell Chen <aur@sorz.org>
pkgname=pgvector
pkgver=0.8.1
pkgrel=1
pkgdesc="A vector similarity search extension for PostgreSQL"
arch=('x86_64' 'i686')
url='https://github.com/pgvector/pgvector'
license=('custom')
depends=('postgresql')
makedepends=('llvm' 'clang')
optdepends=()
source=("https://github.com/pgvector/pgvector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a9094dfb85ccdde3cbb295f1086d4c71a20db1d26bf1d6c39f07a7d164033eb4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make OPTFLAGS=""
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

