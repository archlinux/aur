# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=alt
pkgver=2.4.0
pkgrel=1
pkgdesc='Command line utility that attempts to find the "alternate path" for the provided path'
arch=('i686' 'x86_64')
url="https://github.com/uptech/alt"
license=('MIT')
depends=()
conflicts=('alt-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a83facb0468d2986a0330ac39e6db443db9b9f09c00820156309ea1c768b3da5ceb38ff8280ec904c7a8587748b43cbbfd206dca50408dc3c25a69d6bb4592d5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
