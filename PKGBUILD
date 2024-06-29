# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=amber-secrets
_pkgname=amber
pkgver=0.1.6
pkgrel=1
pkgdesc="Manage secret values in-repo via public key cryptography"
arch=("x86_64")
url="https://github.com/fpco/amber"
license=("MIT")
conflicts=('amber')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('26d112c27e4d4ee9ac188d4fc4d1f275502ff2fda033594229119a7542b12ebb')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
