# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-bin}")
source=("https://github.com/orhun/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-${pkgver#v}.tar.gz")
sha256sums=('c3ef72cf2ff652cf5fa2350c90bcfddc323ddf501671d588184276c5b3bd27dd')

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/kmon"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm 644 "man/${pkgname%-bin}.8" -t "$pkgdir/usr/share/man/man8"
  gzip "$pkgdir/usr/share/man/man8/${pkgname%-bin}.8"
}