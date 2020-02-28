# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-bin
pkgver=v0.1.2
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
provides=("${pkgname%-bin}")
conflicts=("$pkgname" "${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/orhun/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-${pkgver#v}.tar.gz")
sha256sums=('5d2310fbae32ba3cba0f37ffa4420692e5ba6c64d5c23f3c3e7207b68b78b610')

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/kmon"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm 644 kmon.man "$pkgdir/usr/local/man/man8/${pkgname%-bin}.8"
  gzip "$pkgdir/usr/local/man/man8/${pkgname%-bin}.8"
}