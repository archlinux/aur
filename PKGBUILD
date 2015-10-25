# Maintainer: Luca Fulchir <luker at fenrirproject.org>
pkgname=libraptorq
pkgver=0.1.3
pkgrel=1
pkgdesc='Forward error correction library implementing RaptorQ algorithm'
arch=('i686' 'x86_64')
url='https://www.fenrirproject.org'
license=('LGPL3')
depends=('eigen>=3.1.0')
makedepends=('cmake')
source=('https://www.fenrirproject.org/Luker/libRaptorQ/repository/archive.tar.gz?ref=v0.1.3')
sha1sums=('29366c7f1480ab62de38f72346af3b36a5155490')
sha256sums=('91cd4fc2a7e6707e575dba60eaa76d32ac3a141ad528bc84f2009beb04facd18')

build() {
  mv "$srcdir/libRaptorQ-v$pkgver-2a1bc0d4e4d8836e759a90ddf97e6c2bb191817d" "$srcdir/$pkgname-$pkgver"
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

