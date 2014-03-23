# Maintainer: Lucas De Marchi <lucas.de.marchi@gmail.com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Igor Scabini <furester at gmail.com>

pkgname=lightmediascanner
pkgver=0.4.5.0
pkgrel=1
pkgdesc="A lightweight library to scan media"
arch=('i686' 'x86_64')
url="http://lms.garage.maemo.org/"
license=('LGPL')
depends=('sqlite3' 'libvorbis' 'libmp4v2' 'flac')
source=("http://packages.profusion.mobi/lightmediascanner/$pkgname-$pkgver.tar.bz2")
md5sums=('cb51f52ac8ba514987ae3f5278b628b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-video-dummy \
    --enable-audio-dummy

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
