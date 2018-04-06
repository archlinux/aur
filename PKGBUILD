# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.8.0
pkgrel=2
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=()
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git' 'oniguruma')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('4cecd37786e04c1989f24165a8900628837fef108764371752bf67363f57f6bfe58ea51b2f1571a82d1c6cbf3a20f5149eaa3eb68c884f88b993d54379fbd957')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    # install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
