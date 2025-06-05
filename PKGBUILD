# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=titlecase
pkgver=3.6.0
pkgrel=1
pkgdesc='A tool for making text title case'
arch=('i686' 'x86_64')
url="https://github.com/wezm/titlecase"
license=('MIT')
depends=()
conflicts=('titlecase-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d73fac5fcba3046cf23afe260bb2c58b4878d5b9d06830c0d8ebe22b01eb8d4f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
