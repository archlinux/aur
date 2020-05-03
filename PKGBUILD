# Maintainer: Justin Harrison <me@justinharrison.ca>

pkgname=diceware-gen
pkgver=0.3.0
pkgrel=1
arch=("i686" "x86_64")
url="https://gitlab.com/jmatthin/$pkgname"
license=("GPL3")
depends=("rust")
source=("$url/-/archive/$pkgver/diceware-gen-$pkgver.tar.gz")
sha512sums=("55240a31b27f04ece6a28accc266a70b3739317871c32face8b37982f0ff74dcda93396f0963e5ce70d2e1b7abc2aca0666f681e12bd345d6f0633c43cc9d364")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m 755 eff_large_wordlist.txt "$pkgdir/usr/share/diceware-gen/eff_large_wordlist.txt"
}
