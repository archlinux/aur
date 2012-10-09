# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=vdpau-video
pkgver=0.7.3
pkgrel=3
pkgdesc="VDPAU backend for VA API"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/vaapi/vdpau-driver/"
license=('GPL')
depends=('libva' 'libvdpau')
makedepends=('mesa')
options=('!libtool')
source=(http://www.splitted-desktop.com/~gbeauchesne/vdpau-video/$pkgname-$pkgver.tar.gz)
md5sums=('18870e007ecdc50a528861fa55556364')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:


