# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.9.2
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('9318568bdef9461afe4552b8660ea4bc02d8d7f4af04dfb9a50656508c9730feb1d1425f150a34adbebe9f56a2748edc377c3fdfd355e891bdbee9bc0fb10060')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
