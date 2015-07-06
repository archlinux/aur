# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=opensmile
pkgver=2.0.rc1
pkgrel=1
pkgdesc="A fast, real-time (audio) feature extraction utility for automatic speech, music and paralinguistic recognition research"
arch=('i686' 'x86_64')
url="http://opensmile.sourceforge.net/"
license=('GPL')
depends=('portaudio')
options=('!makeflags')
source=("https://downloads.sourceforge.net/project/opensmile/$pkgname-${pkgver/.r/-r}.tar.gz")
md5sums=('2d938e86cd9d1a7ad3d24dcb3c721882')

build() {
  cd "$pkgname-${pkgver/.r/-r}/$pkgname"
  ./autogen.sh
  ./autogen.sh
  ./configure --prefix="/usr" --with-portaudio="yes"
  make
}

package() {
  cd "$pkgname-${pkgver/.r/-r}/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
