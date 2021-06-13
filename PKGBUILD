# Maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>

pkgname=chunkfs
pkgver=0.8
pkgrel=1
pkgdesc="A FUSE  based filesystem that allows mounting an arbitrary file or block device as a directory tree of files that each represent a chunk of user-specified size of the mounted file."
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://chunkfs.florz.de/"
depends=(fuse)
makedepends=(perl)
license=('GPL')
provides=(chunkfs)
conflicts=(chunkfs)
source=(http://chunkfs.florz.de/${pkgname}_${pkgver}.tar.xz)
sha256sums=('1c5bf9d6d6b678d5bd42df42529da84d3942f0ba707355ca47fb98ccc0df77cf')

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
