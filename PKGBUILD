# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.11
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('9608b1761d3937a01506241ab61665bb8328f1d8fe0c305e9e2dda9c8a5bd632475dc41ee2d453f6405a34a5f1095e2616cb532d8b7ce41690b6dccdc3d142a1'
                   'c4cb5c7b45a4176c9bc09b4895cf9cc2ca5e844ad418b7f4052d36e15b94b04359f254c3960469bbe29cbd15faf327e206e7f1a62409455aafa324428303c98d')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
