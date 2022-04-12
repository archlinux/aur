# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=fhc-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Fast HTTP Checker"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/fhc"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md"
               "$pkgname-$pkgver-man.1::$url/raw/$pkgver/${pkgname%-bin}.1")
sha256sums_x86_64=('b8303b809104cf9eb4410c4ce90d49db65473a25887ab8b1d95f81248f37581f'
                   'fedfc97125f90148974bcc759c944d413b2d75bbc23627ccfd9c92d91449410f'
                   '1ff3bf56620c0467baf7f8cf1d60fb362f821d9c22b8143d396ae11f356b411c')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
