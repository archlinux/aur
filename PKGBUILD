# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=titlecase
pkgver=3.2.0
pkgrel=1
pkgdesc='A tool for making text title case'
arch=('i686' 'x86_64')
url="https://github.com/wezm/titlecase"
license=('MIT')
depends=()
conflicts=('titlecase-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3f67c5140ff17b6ae19291a519fd2f532a2c8916aa48934476ee2eaf8f9523bc')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
