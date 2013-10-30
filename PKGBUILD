# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=libva-vdpau-driver
pkgver=0.7.4
pkgrel=1
pkgdesc="VDPAU backend for VA API"
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('GPL')
depends=('libva' 'libvdpau')
makedepends=('mesa')
replaces=('vdpau-video')
source=(http://www.freedesktop.org/software/vaapi/releases/$pkgname/$pkgname-$pkgver.tar.bz2)
sha1sums=('224318f4ea8bafca6a0fec770e388b7d1a1a66b3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:


