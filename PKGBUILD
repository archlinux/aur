# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
 
pkgname=io
pkgver=2011.09.12
pkgrel=1
pkgdesc='IO programming language'
arch=('x86_64' 'i686')
url='http://iolanguage.com/'
license=('BSD')
depends=('pcre' 'libsndfile' 'libxmu' 'freetype2' 'libedit' 'libxml2' 'libtiff' 'libevent' 'yajl' 'libmysqlclient' 'lzo2' 'libpng' 'python2' 'util-linux' 'freeglut' 'libjpeg-turbo' 'libtheora')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevedekorte/io/tarball/$pkgver")
options=('!makeflags' '!buildflags')
sha256sums=('7b4cb97a0aa3abb562703e1dbfe46925c22820eeca6969865b979c397799d092')

build() {
  mkdir -p stevedekorte-io-23afbcc/build
  cd stevedekorte-io-23afbcc/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd stevedekorte-io-23afbcc/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../license/bsd_license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/bsd_license.txt"
}

# vim:set ts=2 sw=2 et:
