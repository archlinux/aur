# Maintainer: Oleh Prypin <oleh@pryp.in>
pkgname=crystal-icr
pkgver=0.9.0
pkgrel=2
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('shards')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('2530293e94b60d69919a79b49e83270f1462058499ad37a762233df8d6e5992c')

build() {
  cd "icr-$pkgver"
  make
}

# check() {
#   cd "icr-$pkgver"
#   make test
# }

package() {
  cd "icr-$pkgver"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
