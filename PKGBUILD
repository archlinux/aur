# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.10.4
pkgrel=2
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('0a235f87e40b3d49c7565f250544f91a709f6561801fe79f9c48a47bccaba5f200a7a30beb458c1e16e3830ee36e7bd4bd55c055f123ba43f667de1465e1fb09'
                   'c7dc4c778bb37c7959221b45757f04375a15a2debb056e790fb76b02ad84e2916126d56dbd3385083892423243fe504c9322c17162632fc01f05545470124926')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
