# Maintainer: Samuel Åkesson <sermuns@lysator.liu.se>
pkgname=stil
pkgver=0.4.3
pkgrel=1
pkgdesc="generate STatic site from Index Listing of directory"
url="https://github.com/sermuns/stil"
license=("WTFPL")
provides=("stil")
conflicts=("stil")
source=("https://github.com/sermuns/stil/archive/refs/tags/v$pkgver.tar.gz")
arch=('x86_64')
makedepends=('cargo')
sha256sums=('34184ba92d9f5aeeb8a6b8fa52af583038213993df07894d0e92ed329c2c8cca')
options=(!debug)

build() {
  cd "stil-$pkgver"
  cargo build --release
}

package() {
  cd "stil-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
