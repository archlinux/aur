# maintainer: luka null <lukadevnull@vivaldi.net>
pkgname=pg_task
pkgver=2.1.29
pkgrel=1
pkgdesc='PostgreSQL job scheduler for asynchronous background SQL execution'
arch=('x86_64')
url='https://github.com/RekGRpth/pg_task'
license=('MIT')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm' 'curl' 'pcre')
install="$pkgname.install"
source=("https://api.pgxn.org/dist/$pkgname/$pkgver/$pkgname-$pkgver.zip")
sha256sums=('6fa7fe6c5187db5bb8fbe7477c00bd76042bb73c0f2df50c2e904b74567f31ca')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
