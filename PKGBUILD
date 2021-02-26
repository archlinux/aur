# Maintainer: lmartinez-mirror <lmartinez-mirror at noreply dot github dot com>
pkgname=baru
pkgver=0.2.6
pkgrel=2
pkgdesc='A system monitor written in Rust and C'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
depends=('libpulse')
makedepends=('git' 'rust' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c2e415369e46f9b54a5f3c7f7b59ee4eb6de3f0f394cf92ca0f6e3302a7b2152f6a9092b6eb912a3ff09cbec3b98f8524cecd5c9d847088f6f3536d75c2f2938')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm 755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

