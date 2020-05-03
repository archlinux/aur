# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=s3rename
pkgver=0.1.0
pkgrel=1
pkgdesc='Tool to mass-rename S3 keys'
arch=('x86_64')
url='https://github.com/jamesmcm/s3rename'
license=('MIT' 'APACHE')
makedepends=('rust')
depends=('openssl')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fec5fe4a1c95894d02c9f381f36b9a7d2fca2e9e6fb4e62b86f4586856d03345')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

