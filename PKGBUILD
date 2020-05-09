# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=s3rename
pkgver=0.1.1
pkgrel=1
pkgdesc='Tool to mass-rename S3 keys'
arch=('x86_64')
url='https://github.com/jamesmcm/s3rename'
license=('MIT' 'APACHE')
makedepends=('rust')
depends=('openssl')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9014e3339ef2e7934f9f1fa7c9f5e03f9f71167e046bc6e272d49e8e3c172bcf')

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

