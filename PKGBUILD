# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=hound
pkgver=0.2.0
pkgrel=1
pkgdesc='Extremely fast source code search engine'
arch=(i686 x86_64)
license=(MIT)
url='https://github.com/etsy/Hound'
makedepends=(go)
source=($pkgname-$pkgver.zip::https://github.com/etsy/Hound/archive/v$pkgver.zip)
sha1sums=('3d04d830e2601e732001ed3c04e92f73a6c8043c')

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make test
}

package() {
  cd $pkgname-$pkgver
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" bin/{hound,houndd}
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m 644 -D config-example.json "$pkgdir"/usr/share/$pkgname/config-example.json
}
