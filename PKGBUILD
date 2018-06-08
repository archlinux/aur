# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=zita-jclient
pkgver=0.4.0
pkgrel=2
pkgdesc="A C++ library to create a JACK client with a few lines of code"
arch=(i686 x86_64)
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/"
license=('GPL3')
depends=('jack')
source=("${url}$pkgname-$pkgver.tar.bz2")
md5sums=('481ed470d2d0096d717db949f79089ca')


prepare() {
    cd "$srcdir/$pkgname-$pkgver/libs"
    sed -i -e '/ldconfig/d' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver/libs"

  make PREFIX=/usr LIBDIR=lib
}

package() {
  cd "$srcdir/$pkgname-$pkgver/libs"

  make PREFIX=/usr LIBDIR=lib DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
