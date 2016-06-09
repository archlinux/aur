# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=adbfs-rootless-git
pkgver=r77.e6a3bc6
pkgrel=1
pkgdesc='fuse filesystem over adb tool for android devices, no device root required'
arch=(i686 x86_64)
url='https://github.com/spion/adbfs-rootless'
license=(BSD)
depends=(gcc-libs fuse)
makedepends=(git)
source=(git+https://github.com/spion/adbfs-rootless)
sha1sums=('SKIP')

pkgver() {
  cd adbfs-rootless
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd adbfs-rootless
  make
}

package() {
  cd adbfs-rootless
  install -Dm755 adbfs "$pkgdir/usr/bin/adbfs"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
