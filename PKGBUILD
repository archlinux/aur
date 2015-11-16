# Maintainer: Luca Fulchir <luker at fenrirproject.org>
pkgname=libraptorq
pkgver=0.1.4
pkgrel=1
pkgdesc='Forward error correction library implementing RaptorQ algorithm'
arch=('i686' 'x86_64')
url='https://www.fenrirproject.org'
license=('LGPL3')
depends=('eigen>=3.1.0')
makedepends=('cmake')
source=("https://www.fenrirproject.org/Luker/libRaptorQ/repository/archive.tar.gz?ref=v${pkgver}")
sha1sums=('5f63c017fc427ff4cfe00e627e20c903f0ddc736')
sha256sums=('d9ab1c4f12cfc3bf2641982ae67350bc0bb3e85c09b6186bb09a29b8beebf6e1')

build() {
  mv "$srcdir/libRaptorQ-v$pkgver-ef4f5afe8fa0d65d2e6c9a32618e5a67ae421b7e" "$srcdir/$pkgname-$pkgver"
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

