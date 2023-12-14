# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=wl-gammarelay-rs
pkgver=0.3.2
pkgrel=2
pkgdesc="Like wl-gammarelay, but written in rust, runs on a single thread, has three times less SLOC and uses DBus (for simplicity)"
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/MaxVerevkin/wl-gammarelay-rs"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6931eccf49e466fb03d48a0df87ca53a0cfc46a900a44ac4d6e85de029aba8d0')
sha512sums=('029adde9d14a2577bd074ef3dcfecbd01f6443d3e05d9be8dab666f3425abbb9a830f5f216f5339d60d16d96424d911b6ea641064596f76cce7e1171adb80d3b')
b2sums=('31683320016850b0063aa612755bedbef2159af8c5ab124bc47d7235e9fd854d301256269a2b84baa6b9655657b46a6a9995ebf14f4c61fba9119ffb55aa3a40')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
