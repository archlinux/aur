# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=chars
pkgver=0.4.1
pkgrel=1
pkgdesc='Command line tool to display information about unicode characters.'
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/chars"
license=('MIT')
depends=()
conflicts=('chars-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7816cb435c9c2977ae704c6176e97ce4f5a7bb40621aaf9c5104598c29277b77')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
