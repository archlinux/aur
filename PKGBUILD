# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.9
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('c3e0f8d7244a6ce62167c448b7cdf3ec370b3eb06a9b864f4f3c5f6755fba87a5ce10870ecf7bfe6efb1776b1112b20b0f538b6dc4efe38c3fbb013e2c54b74b'
                   '5716d2ae9b213c22a99ea691b1b75980455f0af2781b34ba228977232077092471781135d969c95644da80fe0bfe7c1860d289883f3f68cc6a173ca1fe6be3f8')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
