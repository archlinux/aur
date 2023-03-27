# Maintainer Shell Chen <aur@sorz.org>
pkgname=pgvector
pkgver=0.4.1
pkgrel=1
pkgdesc="A vector similarity search extension for PostgreSQL"
arch=('x86_64' 'i686')
url='https://github.com/pgvector/pgvector'
license=('custom')
depends=('postgresql')
makedepends=('git')
optdepends=()
source=("https://github.com/pgvector/pgvector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12dc08c33165a2f14d97d1c153d6ec3dc0c8d1b8c53ac3ba8b44517e8795444c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

