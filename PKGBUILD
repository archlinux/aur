# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=chars
pkgver=0.2.0
pkgrel=1
pkgdesc='Command line tool to display information about unicode characters.'
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/chars"
license=('MIT')
depends=()
conflicts=('chars-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0197b7d3bd3dba359a4ce3eba79717a787844733976cafb19b7f53097493a8c2bd4cb469b2d7c3f9a6ae497c8365eebb9630697594b02f2f9c5ac67d01551c4c')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    # install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
