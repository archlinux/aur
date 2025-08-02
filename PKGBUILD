# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=rusolver-bin
_pkgname="${pkgname%-bin}-linux"
pkgver=0.10.2
pkgrel=1
pkgdesc="Fast and accurate DNS resolver"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/rusolver"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/${_pkgname}-x64.zip"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md"
               "$pkgname-$pkgver-man.1::$url/raw/$pkgver/${pkgname%-bin}.1")
sha256sums_x86_64=('1b16af081beb6fd002039b64c5bc5630b1ce63aed91c7722bc8180a2813ca6b5'
                   '461a673b77c2b0f5f697a8d60fa321cb377b135a6f1b2a2a3a870414b860b411'
                   '29cfe6eaf6ca5618781dca54e94844859d9734afb4bd21e102599c0089e41c0d')

package() {
  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
