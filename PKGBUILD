# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.7.0
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=()
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('09bee344e411c1d3a8ab9bf9b2da5c4b022f28a69625331fac613602f1477a32dd0717ce8d9e29f57543242229cef8068dff71266c5a4dfcb51d10b8f0729b39')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    # install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
