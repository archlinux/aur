# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=hexyl
pkgver=0.2.0
pkgrel=2
pkgdesc='A command-line hex viewer'
arch=('x86_64')
url='https://github.com/sharkdp/hexyl'
license=('APACHE' 'MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c45e0b67da7e9e3e9921db11db5a6bcfaf1c253c2644a21d94a084af8dedff60')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}