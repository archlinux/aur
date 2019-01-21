# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=hexyl
pkgver=0.4.0
pkgrel=1
pkgdesc='A command-line hex viewer'
arch=('x86_64')
url='https://github.com/sharkdp/hexyl'
license=('APACHE' 'MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7450d8e0d382a9f78c5fa6de562359749586824d74c708c983da5a9c032bfd43')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
