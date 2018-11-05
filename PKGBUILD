# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.6.0
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('970d5ecbde6bb370c8178339db42e7812b7a2f3a5db3eec868cc18c19523c0ea')

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
