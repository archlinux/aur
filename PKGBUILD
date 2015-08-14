# Maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>

pkgname=chunkfs
pkgver=0.7
pkgrel=1
pkgdesc="A FUSE  based filesystem that allows mounting an arbitrary file or block device as a directory tree of files that each represent a chunk of user-specified size of the mounted file."
arch=(i686 x86_64)
url="http://chunkfs.florz.de/"
depends=(fuse)
makedepends=(perl)
license=('GPL')
provides=(chunkfs)
conflicts=(chunkfs)
source=(http://chunkfs.florz.de/${pkgname}_${pkgver}.tar.gz)
sha256sums=('4c168fc2b265a6ba34afc565707ea738f34375325763c0596f2cfa1c9b8d40f1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() { 
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
