# Maintainer: Anatol Pomozov

pkgname=bootimg-tools-git
pkgver=r10.cc55014
pkgrel=1
pkgdesc='Android boot.img creation and extraction tools'
url='https://github.com/pbatard/bootimg-tools'
license=(Apache)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
source=(git://github.com/pbatard/bootimg-tools)
sha256sums=('SKIP')

pkgver() {
  cd bootimg-tools
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd bootimg-tools
  make
}

package() {
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" bootimg-tools/mkbootimg/{mkbootimg,unmkbootimg}
}
