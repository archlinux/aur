# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=ptail
pkgver=0.2.2
pkgrel=1
pkgdesc='Stream and display a fixed number of lines from processes output'
arch=('x86_64')
url="https://github.com/orf/ptail"
license=('MIT')
depends=()
conflicts=('ptail-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1bd4d68bd13c901d6ab045c52cb49cfd39448941a880cec12dd88c7e922a549f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
