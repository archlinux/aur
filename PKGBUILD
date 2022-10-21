# Maintainer: Kyle Fuller <kyle@fuller.li>
pkgname=znc-palaver
pkgver=1.2.2
pkgrel=1
pkgdesc='ZNC module for push notifications'
arch=('x86_64')
url='https://github.com/cocodelabs/znc-palaver'
license=('MIT')
depends=('znc')
source=("https://github.com/cocodelabs/znc-palaver/archive/$pkgver.tar.gz")
sha256sums=('209880fae8500566a55b1b56c3b712a0352eb0686eddf046971901a1939e01ff')

build() {
  pwd
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m644 palaver.so "${pkgdir}/usr/lib/znc/palaver.so"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
