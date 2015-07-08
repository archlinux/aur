# Maintainer: oliver <ohemming@gmail.com>

pkgname=compute
pkgver=1.0.4
pkgrel=3
pkgdesc="A command-line program that performs simple calculations on input files"
arch=('i686' 'x86_64')
url="http://compute.teamerlich.org/"
license=('GPL3')
makedepends=('gperf')
source=("https://s3.amazonaws.com/agordon/compute/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('8b8634e10d8bde512c17ca0f1f097583')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
