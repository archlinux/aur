# Maintainer: kugland <kugland at gmail dot com>

pkgname=ngrok-tunnel-docker
pkgver=1.0.1
pkgrel=1
pkgdesc="Use ngrok securely using docker"
arch=(x86_64)
url="https://github.com/kugland/ngrok-tunnel-docker"
license=(MIT)
depends=(bash docker)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/kugland/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('186af6da894f204c763206d5057084c460a301c14feea277803acebd20e07ac5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 -o root -g root ngrok-tunnel "$pkgdir/usr/bin/ngrok-tunnel"
  install -D -m 644 -o root -g root LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  install -D -m 644 -o root -g root README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
