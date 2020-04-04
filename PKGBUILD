# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=taptempo
pkgver=1.4.4
pkgrel=2
pkgdesc="A command line tap tempo. Hit enter key with style and you'll get the corresponding number of beats per minute (BPM). This tool is very useful to quickly find the tempo of a song without launching a big digital workstation like Ardour or LMMS"
arch=('x86_64')
url="https://taptempo.tuxfamily.org"
license=('GPL-3.0')
makedepends=('catch2' 'cmake')
source=("https://download.tuxfamily.org/taptempo/${pkgver}/taptempo-${pkgver}.tar.gz")
md5sums=('6b7d859049f41de3bf17c38a0f6aedf4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir _build
  cd _build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

build() {
  cd "$srcdir/$pkgname-$pkgver/_build"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/_build"
  DESTDIR=$pkgdir make install 
}