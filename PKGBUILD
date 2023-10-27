# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=titlecase
pkgver=2.2.1
pkgrel=1
pkgdesc='A tool for making text title case'
arch=('i686' 'x86_64')
url="https://github.com/wezm/titlecase"
license=('MIT')
depends=()
conflicts=('titlecase-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2f70634e9860200b87a3318ad12074c8ae4f14ac868cc6d1d6cbc068a7c4864d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
