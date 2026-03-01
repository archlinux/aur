# Maintainer Shell Chen <aur@sorz.org>
pkgname=pgvector
pkgver=0.8.2
pkgrel=1
pkgdesc="A vector similarity search extension for PostgreSQL"
arch=('x86_64' 'i686')
url='https://github.com/pgvector/pgvector'
license=('custom')
depends=('postgresql')
makedepends=('llvm' 'clang')
optdepends=()
source=("https://github.com/pgvector/pgvector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69f4019389af05dc1c9548deb8628e62878e6e207c03907f2b8af2016472cdaa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make OPTFLAGS=""
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

