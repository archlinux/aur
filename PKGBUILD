# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo')
options=('zipman')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.tar.gz"{,.sig})
sha512sums=('1dc841640c4d2291de5c45c7a7e115c39bdc00ad3d4950e1b17e71998195d0d88fd5ffbf4cfb5756aee5ff689386986e5c30bd2590ef674025af0915a4ed9153'
            'SKIP')
validpgpkeys=('C4B2D24CF87CD188C79D00BB485B7C52E9EC0DC6') # kmon releases <kmonlinux@protonmail.com>

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/${pkgname%-bin}"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 "man/${pkgname%-bin}.8" -t "$pkgdir/usr/share/man/man8"
}