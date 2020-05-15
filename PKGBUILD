# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3-utils
pkgver=1.1.0
pkgrel=1
pkgdesc="Utilities and tools based around Amazon S3 to provide convenience APIs in a CLI"
url="https://github.com/whitfin/s3-utils"
depends=('openssl')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dd1cc3802e88931bad6802b7f2c28c639db816f2760968dff46639dd9a810487')

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