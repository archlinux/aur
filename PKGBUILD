# Maintainer: Márton Szabó <username="notramo" host="vipmail.hu">
pkgname=crystal-icr-git
pkgver=v0.4.0.r5.4495b1d
pkgrel=1
pkgdesc="Interactive console for Crystal programming language. Git version."
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("git+https://github.com/crystal-community/icr")
sha256sums=('SKIP')

pkgver() {
  cd "icr"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "icr"
  make
}

package() {
  cd "icr"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
