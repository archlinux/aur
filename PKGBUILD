# Maintainer: Oleh Prypin <oleh@pryp.in>
pkgname=crystal-icr
pkgver=0.7.0
pkgrel=2
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('shards')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('181046ff6ea3502573ad6af3e53bcd4b4cede1ed6e58410bd61c6dc28e8cb0ac')

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
