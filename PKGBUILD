# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.10.1
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('35b041db8a4a5badcef579175a3744a95b27535a2eed6c798f0b3b1bfbe0ba9201af38b7b79245412ff39ddec50096f8916e421286ff89149f9d1f50dbea167c')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
