# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=apk-decompiler
pkgver=0.2.1
pkgrel=1
pkgdesc='Small Rust utlity to decompile Android apks'
arch=('x86_64')
url='https://github.com/robertohuertasm/apk-decompiler'
license=('MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('817cb2e2566745c5437fd09394bdf2fdafbd46bb4e70e16df610b9f022abc67b')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
