# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=fhc-bin
_pkgname="${pkgname%-bin}-linux"
pkgver=0.9.1
pkgrel=1
pkgdesc="Fast HTTP Checker"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/fhc"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/${_pkgname}-x64.zip"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md"
               "$pkgname-$pkgver-man.1::$url/raw/$pkgver/${pkgname%-bin}.1")
sha256sums_x86_64=('180c1a604a51b6ff220603d5c41053c73d2800ba2843d7f819f8ec2ccc8466da'
                   'fedfc97125f90148974bcc759c944d413b2d75bbc23627ccfd9c92d91449410f'
                   'd9b589aca7473757a322c071ec4a5847926eeb5138bf9d06fb6921d61bad6e80')



package() {
  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
