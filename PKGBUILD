# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=chars
pkgver=0.2.1
pkgrel=1
pkgdesc='Command line tool to display information about unicode characters.'
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/chars"
license=('MIT')
depends=()
conflicts=('chars-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5073ffdec13d530c8a72765462ee8755c8beb1d805276cb46511faaa034b36d7')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    # install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
