# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.10.9
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('7b6d828263aeba7e6561ee3c204b998b0f1f64420ef82bf6b00dd8e463fa0a40a255149d5bf29c4e3444f0b6398a8eee6d69f1ddaa17cd179aa158e5c248d0b4'
                   '12994f1b204df02c68493b2c7f4cca9c99cf044f1247764035da6fa86e2147b384b3b9fdbfad99bafb45e96860a8e8e7d913af19dcc13e099d758aeea979574b')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
