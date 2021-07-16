# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kmon-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('gcc-libs' 'libxcb')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.sig})
sha512sums_x86_64=('6407f328140ae1858e5cf7183b31b0f67ea84b7aab7a2e98b07279b875ef542003430c6862fb73af26efead0bbad59398b7c41cc0dd8473c820ec5c41b64eacd'
                   'SKIP')
validpgpkeys=('C4B2D24CF87CD188C79D00BB485B7C52E9EC0DC6') # kmon releases <kmonlinux@protonmail.com>

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/${pkgname%-bin}.8" -t "$pkgdir/usr/share/man/man8"
}
