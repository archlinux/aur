# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kmon-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('gcc-libs' 'libxcb')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.sig})
sha512sums_x86_64=('82293d28fb344026e52efc501876a874420d5d16217d8e55ba30a293751e02a8f25bde65e36abbe88189a85ff1a10c1705cc5f1f111677ef3453ba003b037aeb'
                   'SKIP')
validpgpkeys=('C4B2D24CF87CD188C79D00BB485B7C52E9EC0DC6') # kmon releases <kmonlinux@protonmail.com>

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/${pkgname%-bin}.8" -t "$pkgdir/usr/share/man/man8"
}
