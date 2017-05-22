# Maintainer: Felipe Barriga Richards < felipe at felipebarriga DOT cl >
pkgname=fuse_xattrs
pkgver=0.3
pkgrel=3
pkgdesc='A filesystem that provides xattr support using sidecar files.'
arch=('i686' 'x86_64')
url='https://github.com/fbarriga/fuse_xattrs'
license=('GPL3')
source=("git+https://github.com/fbarriga/fuse_xattrs.git#tag=v${pkgver}")
md5sums=('SKIP')
makedepends=('cmake')
depends=('fuse2')

build() {
  cd "$srcdir/fuse_xattrs"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/fuse_xattrs"
  cd build
  make DESTDIR=$pkgdir install
}
