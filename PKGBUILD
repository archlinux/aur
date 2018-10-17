# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=chars
pkgver=0.3.2
pkgrel=1
pkgdesc='Command line tool to display information about unicode characters.'
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/chars"
license=('MIT')
depends=()
conflicts=('chars-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8de42bf53e3e30ffd82549c2f9b38b235ad8ec35877f3c1e22ee489fcdd22a35')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
