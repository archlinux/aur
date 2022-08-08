# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Binary installation for Rust projects"
arch=('x86_64')
url="https://github.com/cargo-bins/cargo-binstall"
license=('GPL3')
depends=('xz')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tgz"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('f97556ff3202584dc4040c302dd279d17bf4d7e7f19f1ff137e55000521204f7f0bebbc2c4a8905bf4aaf7c4c36145db9dc9610ba88f17bb9d07bfb7168af0fe'
                   'a80edfffeed20f67f4feef02dc9f6e721f0f73d2afe98e0d9c188f1ebe0cfb8aa7754fc435a1014bf9c4303ba4b0ec8cc85dbda25eab56bf6ef70d87b4e2811f')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
