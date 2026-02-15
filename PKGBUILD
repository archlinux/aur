# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgbin=passc
pkgver=0.1.0
pkgrel=2
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7b3a4c729662e86fdb5d58998e6123d49dbe4aea5a15e0424a75413c83843df2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgbin" "$pkgdir/usr/bin/$pkgbin"
}
