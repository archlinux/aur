# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=adbfs-git
pkgver=r41.b687e00
pkgrel=1
pkgdesc='fuse filesystem over adb tool for android devices'
arch=(i686 x86_64)
url='https://github.com/isieo/adbFS'
license=(BSD)
depends=(gcc-libs fuse)
makedepends=(git)
source=(git+https://github.com/isieo/adbFS)
sha1sums=('SKIP')

pkgver() {
  cd adbFS
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd adbFS
  make
}

package() {
  cd adbFS
  install -Dm755 adbfs "$pkgdir/usr/bin/adbfs"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
