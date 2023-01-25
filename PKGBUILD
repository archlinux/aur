# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=git-trim
pkgver=0.4.3
pkgrel=1
pkgdesc='Trims your git remote tracking branches'
arch=('i686' 'x86_64')
url="https://github.com/foriequal0/git-trim"
license=('MIT')
depends=('libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1dc891463c31eaa3b9d836eb922448c8f550ae5436f2a5e47ab42c857b5f5cd1')

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
