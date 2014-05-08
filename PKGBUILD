# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: andreas langer <a.langer@q-dsl.de>

pkgname=libg3d
pkgver=0.0.8
pkgrel=1
pkgdesc="A library for loading and manipulating 3D models from various file formats."
arch=('i686' 'x86_64')
url="http://automagically.de/g3dviewer/"
license=('LGPL')
depends=('gtk2' 'libgsf' 'file')
options=('!libtool')
source=("http://automagically.de/files/$pkgname-$pkgver.tar.gz")
md5sums=('23fbb22c24b1db225a3de8b6aaf25774')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

