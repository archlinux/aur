# Maintainer: Márton Szabó <username="notramo" host="vipmail.hu">
pkgname=crystal-icr-git
pkgver=0.4.0
pkgrel=1
pkgdesc="Interactive console for Crystal programming language. Git version."
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("git+https://github.com/crystal-community/icr")
sha256sums=('SKIP')

build() {
  cd "icr"
  make
}

check() {
  cd "icr"
  make test
}

package() {
  cd "icr"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
