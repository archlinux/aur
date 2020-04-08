# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3-meta
pkgver=1.0.1
pkgrel=1
pkgdesc="Gather metadata about your S3 buckets"
url="https://github.com/whitfin/s3-meta"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('89d09b6108aa9caf4b7091046f3784d4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd target/release
  install -Dm755 s3-meta "$pkgdir/usr/bin/s3-meta"
}