# Maintainer: pwnwriter < hey@pwnwriter.xyz >

pkgname=presenterm-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal slideshow tool"
arch=('x86_64')
url="https://github.com/mfontanini/presenterm"
license=('BSD 2-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/presenterm-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('214788284385294aef1b5ca41e4ca6db669350879a1e11325f7877adebc1508a38702b87695ab134bd91dcd777fbd0434aa42e5a489cb81806c405edfe9349a7')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
