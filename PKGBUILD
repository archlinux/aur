# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Lucas De Marchi <lucas dot de dot marchi at gmail dot com
# Contributor: Anton Bazhenov <anton dot bazhenov at gmail>
# Contributor: Igor Scabini <furester at gmail dot com>

pkgname=lightmediascanner
pkgver=0.5.2
pkgrel=1
pkgdesc="Lightweight library to scan media"
arch=('i686' 'x86_64')
url="https://github.com/profusion/lightmediascanner"
license=('LGPL')
depends=('sqlite' 'libmp4v2' 'ffmpeg' 'file')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/profusion/lightmediascanner/archive/release_$pkgver.tar.gz")
sha256sums=('bf17c9aafd98aa89fe7abe1d45701b6cac574f36149d1d6c5d9636d1d98a42bc')

prepare() {
  cd $srcdir/$pkgname-release_$pkgver
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $srcdir/$pkgname-release_$pkgver

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd $srcdir/$pkgname-release_$pkgver
  make DESTDIR="$pkgdir" install
}
