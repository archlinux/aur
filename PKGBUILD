# Maintainer: Your Name <jonas.schaedel@tuhh.de>
pkgname=mensa
pkgver=0.4.2
pkgrel=1
pkgdesc="A CLI tool to query the menu of canteens from the OpenMensa database."
arch=('x86_64')
url="https://github.com/MalteT/mensa"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MalteT/mensa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('049383d3b9f42a2f1c005022f6c128cb98f7c1e250bb3dd1e5322c1ad3db3fd3')

build() {
  cd "$srcdir/mensa-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/mensa-$pkgver"
  install -Dm755 target/release/mensa "$pkgdir/usr/bin/mensa"
}
