# Maintainer: Oleh Prypin <oleh@pryp.in>
pkgname=crystal-icr
pkgver=0.8.0
pkgrel=2
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('shards')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('8c7825dd035bbb4bc6499873d4bd125185a01cae10dc8dd6f98e6e013def381c')

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
