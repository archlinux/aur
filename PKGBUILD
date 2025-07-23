# Contributor: Anatol Pomozov
# Maintainer: tee < teeaur at duck dot com >

pkgname=osquery-bin
pkgver=5.18.1
pkgrel=1
pkgdesc='SQL powered operating system instrumentation, monitoring, and analytics. Without AWS.'
arch=(x86_64)
url='https://osquery.io'
license=('Apache-2.0' 'GPL-2.0-only')
depends=(bash)
makedepends=()
conflicts=(osquery)
provides=(osquery)
#replaces=(osquery)
source=("https://pkg.osquery.io/linux/osquery-${pkgver}_1.linux_$arch.tar.gz")
sha256sums=('4617173d9df4459335fffcc9973496d55a410874b5509378add63afb9545bb00')

package() {
  cp -r etc $pkgdir
  mkdir -p $pkgdir/usr/bin
  mv usr/bin/* $pkgdir/usr/bin/
  #mv usr $pkgdir/
  mv opt $pkgdir
  cp -r var $pkgdir
}
