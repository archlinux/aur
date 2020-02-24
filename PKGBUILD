# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=alt
pkgver=3.2.0
pkgrel=1
pkgdesc='Command line utility that attempts to find the "alternate path" for the provided path'
arch=('i686' 'x86_64')
url="https://github.com/uptech/alt"
license=('MIT')
depends=()
conflicts=('alt-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('415c3a6c50317a2de7d7eff99b2fe8226fe1263754111014f7333f29d0e942fdbcac7821dbf7a615814a7ff5c634f5eb2a617823ad4251f35b362d9ebe26bc04')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
