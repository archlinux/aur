# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Attenuation <ouyangjun1999@gmail.com>

pkgname=apk-decompiler
pkgver=0.2.2
pkgrel=2
pkgdesc='Small Rust utlity to decompile Android apks'
arch=('x86_64')
url='https://github.com/robertohuertasm/apk-decompiler'
license=('MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1489d673209f194b6e2a9cbfdcec03af6906c066203bcccacce2383fbf1b257')

build() {
  cd "$pkgname-$pkgver"

  echo 'stable' > rust-toolchain
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
