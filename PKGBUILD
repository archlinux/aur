# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru
pkgver=0.3.1
pkgrel=1
pkgdesc='A system monitor written in Rust and C'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
depends=('libpulse')
makedepends=('rust' 'cargo')
provides=('baru')
conflicts=('baru')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aabb3e977d7485f3f28c8231783b768c7da9ed3346bdcae72b7319614f03ffb2')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/baru" "$pkgdir/usr/bin/baru"
  install -Dvm 644 "baru.yaml" "$pkgdir/usr/share/baru/baru.yaml"
}

