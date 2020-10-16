# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lfs
pkgver=0.5.1
pkgrel=1
pkgdesc="Get information on your mounted disks"
arch=('x86_64')
url="https://github.com/Canop/lfs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fb533af87ead557fb8fa6dedd028e9663f7e099fd6887f4ba7026347182be7b1aa0d8a7bc51cc0957ad00f8544f1fbe812d97d6ec5bd1a044db4f651feda3fb8')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
