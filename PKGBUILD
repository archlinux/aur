# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo')
options=('zipman')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("https://github.com/orhun/kmon/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.tar.gz"{,.sig})
sha512sums=('2c21304a6e1b2d05b100a2a42d65d45bd3585357480d1be5e2354ba8e3b4dcf4197bba71d51c74d3740a088ff12e2710b0f3eb6706feaf45806c4387219ee42d'
            'SKIP')
validpgpkeys=('C4B2D24CF87CD188C79D00BB485B7C52E9EC0DC6') # kmon releases <kmonlinux@protonmail.com>

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/kmon"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 "man/${pkgname%-bin}.8" -t "$pkgdir/usr/share/man/man8"
}