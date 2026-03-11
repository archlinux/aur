# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgbin=passc
pkgver=0.1.0
pkgrel=4
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3c01d3e39fd31d5ea0952a6b5685dc879cbd360a7f7e544e5c77f865418e4a36')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgbin" "$pkgdir/usr/bin/$pkgbin"
}
