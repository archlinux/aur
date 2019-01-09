# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=hexyl
pkgver=0.3.0
pkgrel=1
pkgdesc='A command-line hex viewer'
arch=('x86_64')
url='https://github.com/sharkdp/hexyl'
license=('APACHE' 'MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7a6b8c6058fa887105dcd5f85b2808b2e0e7557f13b28d6fe802ce5609ff473e')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
