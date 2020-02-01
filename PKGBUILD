# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=titlecase
pkgver=1.1.0
pkgrel=1
pkgdesc='A tool for making text title case'
arch=('i686' 'x86_64')
url="https://github.com/wezm/titlecase"
license=('MIT')
depends=()
conflicts=('titlecase-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('967502c98a81fa1f49de798410cb1c0bc7a54a81e773492451da78608c3d77dc')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
