# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=ruut
pkgver=0.6.1
pkgrel=1
pkgdesc='Print arbitrary trees on the command line.'
arch=('i686' 'x86_64')
url="https://github.com/HarrisonB/ruut"
license=('MIT')
depends=()
conflicts=('ruut-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('db306a022211dae74c9b4fb1e10bdb532fbcbde9d4502fde89c15b5d364d5826')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
