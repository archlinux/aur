# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lantald <lantald at Gmx dot com>
# Contributor: Danilo <aur at dbrgn dot ch>

pkgname=spatialindex
pkgver=1.8.5
pkgrel=2
pkgdesc='Extensible framework that supports robust spatial indexing methods and sophisticated spatial queries'
arch=(x86_64)
url="https://libspatialindex.github.io/"
license=(MIT)
depends=(gcc-libs)
source=("https://download.osgeo.org/libspatialindex/$pkgname-src-$pkgver.tar.gz")
sha256sums=('7caa46a2cb9b40960f7bc82c3de60fa14f8f3e000b02561b36cbf2cfe6a9bfef')

build() {
  cd $pkgname-src-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-src-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
