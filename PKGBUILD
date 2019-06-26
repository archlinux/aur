# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libsyncdir
pkgver=1.0
pkgrel=1
pkgdesc='Alternate implementation for open, link, rename, and unlink that executes a fsync on any modified directories'
url='https://untroubled.org/syncdir'
arch=('x86_64')
license=('GPL2')
source=("$url/syncdir-$pkgver.tar.gz")
sha256sums=('f30d8e0acb0e56dd5c8e90107d79fcaafe40bdc030a0ea66c152b9f54fc2eff0')

build() {
  cd syncdir-$pkgver
  make libsyncdir.so
}

package() {
  cd syncdir-$pkgver
  install -Dt "$pkgdir/usr/lib/" libsyncdir.so
}
