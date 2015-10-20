# Maintainer: Luca Fulchir <luker at fenrirproject.org>
pkgname=libraptorq
pkgver=0.1.2
pkgrel=1
pkgdesc='Forward error correction library implementing RaptorQ algorithm'
arch=('i686' 'x86_64')
url='https://www.fenrirproject.org'
license=('LGPL3')
depends=('eigen>=3.1.0')
makedepends=('cmake')
source=('https://www.fenrirproject.org/Luker/libRaptorQ/repository/archive.tar.gz?ref=v0.1.2')
sha1sums=('5204ba9ea93fb0c7230617dc58b975ad8fb2f0e8')
sha256sums=('7ee8b9c27f687a989fbd1886c40fb0b5c74a8e86474f978e616e0f17ea089fbb')

build() {
  mv "$srcdir/$pkgname-v$pkgver-455de5be70935befbc9c066e8fa13eb613079679" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make install DESTDIR=${pkgdir}

}

