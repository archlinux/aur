# Maintainer: Kyle Fuller <kyle@fuller.li>
pkgname=znc-palaver
pkgver=1.2.0
pkgrel=1
pkgdesc='ZNC module for push notifications'
arch=('x86_64')
url='https://github.com/cocodelabs/znc-palaver'
license=('MIT')
depends=('znc')
source=("https://github.com/cocodelabs/znc-palaver/archive/$pkgver.tar.gz")
sha256sums=('d112e19e6d0fbc9936b19cd17294c448981974cacb1da3a56dd9bbd07d1135fd')

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
