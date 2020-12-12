# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.10.7
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('47ee95679362bcb37eab90a7d3f1701ebb30a0d08f1c0095956d5a82595e9713dfc7fbadffbd132b4c3ca998aeeede61f1075d75e9155888869cb7b5bac5104f'
                   '30045d59d073bed63190c2b738ac234311d8b6e2afe371e13d388ca258a91df93ff16a5147cb230b5e542f294f3e3b631987bba528db6753570afa2d823e1776')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
