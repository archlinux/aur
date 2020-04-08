# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3-utils
pkgver=1.1.0
pkgrel=1
pkgdesc="Utilities and tools based around Amazon S3 to provide convenience APIs in a CLI"
url="https://github.com/whitfin/s3-utils"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('5926df3683894a9655e4ba5c5a83991e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd target/release
  install -Dm755 s3-utils "$pkgdir/usr/bin/s3-utils"
}