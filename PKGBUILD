# Maintainer Shell Chen <aur@sorz.org>
pkgname=pgvector
pkgver=0.6.2
pkgrel=1
pkgdesc="A vector similarity search extension for PostgreSQL"
arch=('x86_64' 'i686')
url='https://github.com/pgvector/pgvector'
license=('custom')
depends=('postgresql')
makedepends=('llvm' 'clang')
optdepends=()
source=("https://github.com/pgvector/pgvector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a11cc249a9f3f3d7b13069a1696f2915ac28991a72d7ba4e2bcfdceddbaeae49')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

