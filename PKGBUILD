# Maintainer: Samuel Åkesson <sermuns@lysator.liu.se>
pkgname=stil
pkgver=0.4.2
pkgrel=1
pkgdesc="generate STatic site from Index Listing of directory"
url="https://github.com/sermuns/stil"
license=("WTFPL")
provides=("stil")
conflicts=("stil")
source=("https://github.com/sermuns/stil/archive/refs/tags/v$pkgver.tar.gz")
arch=('x86_64')
makedepends=('cargo')
sha256sums=('e135309bef13a81f10623e355fba816c6d8dd42b7e4f25a99c42f45f0815e915')
options=(!debug)

build() {
  cd "stil-$pkgver"
  cargo build --release
}

package() {
  cd "stil-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
