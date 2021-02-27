# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.0
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
sha512sums_x86_64=('7a74267fc4bb3658cecc2b1d9c89e9bb3fa3d9871f7837f3f3a6defa3fcbad85eea9caf17216da113139d51d200863df07c4019ded2cca526dd30503ed1ff6f8'
                   'c4ec9e080323b2c934b4c2ce39e59e3b03c96cb20dcc28b3f5c81309e112b926333a8f4c0e7a658b824a1ec34eb6612e7bece9717c05620c275068a274dda1ba')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
