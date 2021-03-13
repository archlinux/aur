# Maintainer: Kyle Fuller <kyle@fuller.li>
pkgname=znc-palaver
pkgver=1.2.1
pkgrel=1
pkgdesc='ZNC module for push notifications'
arch=('x86_64')
url='https://github.com/cocodelabs/znc-palaver'
license=('MIT')
depends=('znc')
source=("https://github.com/cocodelabs/znc-palaver/archive/$pkgver.tar.gz")
sha256sums=('1d13f809c59d2625771d005ced81321f2de2f34cf9f645335a94d64b436a1cc6')

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
