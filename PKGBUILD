# Maintainer: Haruue Icymoon <i@haruue.moe>

pkgname=erofs-utils
pkgver=1.0
pkgrel=1
pkgdesc='Userspace utilities for linux-erofs file system'
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git"
license=('GPL2')
depends=('lz4>=1.8.0')
source=("https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-$pkgver.tar.gz")
sha256sums=('508ee818dc6a02cf986647e37cb991b76f7b3e7ea303ffc9e980772de68f3b10')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-lz4-libdir=/usr/lib
  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

