# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=ttv
pkgver=0.2.1
pkgrel=1
pkgdesc='A command line tool for splitting files into test, train, and validation sets. '
arch=('x86_64')
url='https://github.com/sd2k/ttv'
license=('CUSTOM')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}