# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-bin
pkgver=1.3.4
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
sha512sums=('d509cf9c3978f1e940304508dd4f68f6f12e6b78c8deae56049ebcc19c50ed3a896cfa6e675e0aab6a0b7f8e677641139f5aa2a1ce65ad1623ccff54fd46244e'
            'SKIP')
validpgpkeys=('C4B2D24CF87CD188C79D00BB485B7C52E9EC0DC6') # kmon releases <kmonlinux@protonmail.com>

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/kmon"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 "man/${pkgname%-bin}.8" -t "$pkgdir/usr/share/man/man8"
}