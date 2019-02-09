# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=alt
pkgver=3.1.0
pkgrel=1
pkgdesc='Command line utility that attempts to find the "alternate path" for the provided path'
arch=('i686' 'x86_64')
url="https://github.com/uptech/alt"
license=('MIT')
depends=()
conflicts=('alt-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b664fd736d70668657bad32230d155ed62b5d60e74d18f73b84433845915dc5d4c386e2c25b9bc1b4011e0caf7cacf5fe32dbbc729a7fb35dd97c94b57be4313')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
