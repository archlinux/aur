# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgbase=kmeansrex
pkgname=libkmeansrex-git
pkgver=0.1
pkgrel=2
pkgdesc="KMeansRex library"
arch=('any')
url="https://github.com/michaelchughes/KMeansRex.git"
license=('BSD')
groups=()
depends=('eigen')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://github.com/michaelchughes/KMeansRex/archive/master.zip")

md5sums=("51a1acd59a8f3904d3486012b80df254")
sha1sums=("a1c163259293aac1e402e2eca125503bc09d5e2a")
sha256sums=("f2a68554c83c4a27bcda1e2bd6c07dbe1e50f59e34f95cf88c8f6ad6f875f894")
sha512sums=("8848937ce9a86aea4320ca39c8ae9c2d6a812a50d2a184f2b131bcfa2373934a21d141eef2b657e99fc52be23edbacc2de862c70bd70ccb7cd4b8e51a88baa28")

package() {
  mkdir -p $pkgdir/usr/lib/
  make -C $srcdir/KMeansRex* DESTDIR=$pkgdir lib
  cp $srcdir/KMeansRex*/lib/*.so $pkgdir/usr/lib/

  mkdir -p $pkgdir/usr/include/
  cp $srcdir/KMeansRex*/src/KMeansRexCoreInterface.h $pkgdir/usr/include/
}
