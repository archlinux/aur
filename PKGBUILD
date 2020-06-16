# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=alt
pkgver=3.3.0
pkgrel=1
pkgdesc='Command line utility that attempts to find the "alternate" for the provided path'
arch=('i686' 'x86_64')
url="https://github.com/uptech/alt"
license=('MIT')
depends=()
conflicts=('alt-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d543d102165bd4f74a60d259fb292028ab111b1051b1403842019db351601a78')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
