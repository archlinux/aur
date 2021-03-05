# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.1
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
depends=('gcc-libs' 'openssl')
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('d0817883d56ec055f85a92cf5877644c17b4626866837aae7172f8aa0e2727eda07a2244dc0345984dd4088eb050521ebd68650eab1c0a6645a689672bb0a7a5'
                   'db7e3efdae6c5f104598f52b27658e0ed2caf93103dc712846734655dbe73df199e2487e23770e588747673c0b8087e0be3c939085bf261b50e5ef50f0cbd20f')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
