# Maintainer Shell Chen <aur@sorz.org>
pkgname=pgvector
pkgver=0.5.0
pkgrel=1
pkgdesc="A vector similarity search extension for PostgreSQL"
arch=('x86_64' 'i686')
url='https://github.com/pgvector/pgvector'
license=('custom')
depends=('postgresql')
makedepends=('llvm' 'clang' 'llvm15' 'clang15')
optdepends=()
source=("https://github.com/pgvector/pgvector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8aa3504b215467ca528525a6de12c3f85f9891b091ce0e5864dd8a9b757f77b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

