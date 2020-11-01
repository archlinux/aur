# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=globe-cli
_pkgname=globe
pkgver=0.1.2
pkgrel=1
pkgdesc="ASCII globe generator"
arch=('x86_64')
url="https://github.com/adamsky/globe"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9a2c7ff160bf385217584363572fde4424c878114797c56e3705aab56e33791dd28ef44c52a5ecf5d1936c79ca48539e71fd4fc1cae222a26d97b1d541703ff5')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
