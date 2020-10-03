# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=s3rename
pkgver=0.2.0
pkgrel=1
pkgdesc='Tool to mass-rename S3 keys'
arch=('x86_64')
url='https://github.com/jamesmcm/s3rename'
license=('MIT' 'APACHE')
makedepends=('rust')
depends=('openssl')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('78752f228e5cd35f3aaa900edb0b5ec04d767ec83b3fe0666539907320272268')

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

