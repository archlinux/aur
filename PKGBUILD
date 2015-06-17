# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=hound
pkgver=0.2.0
pkgrel=1
pkgdesc='Extremely fast source code search engine'
arch=(i686 x86_64)
license=(MIT)
url='https://github.com/etsy/Hound'
makedepends=(go)
source=(https://github.com/etsy/Hound/archive/v$pkgver.zip)
sha1sums=('beb2067dcbd102ee7a001d8e7394f9877518d4d4')

build() {
  cd Hound-$pkgver
  make
}

check() {
  cd Hound-$pkgver
  make test
}

package() {
  cd Hound-$pkgver
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" bin/{hound,houndd}
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m 644 -D config-example.json "$pkgdir"/usr/share/$pkgname/config-example.json
}
