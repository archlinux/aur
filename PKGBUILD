# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=vix-git
pkgver=de9bdcb
pkgrel=1
pkgdesc="Visual Interface heXadecimal dump"
arch=('any')
url="http://actinid.org/vix/"
license=('unknown')
depends=('sdl')
makedepends=('libtool' 'autoconf')
source=('git+https://github.com/BatchDrake/vix') 
sha1sums=('SKIP')
_gitname=vix

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  libtoolize
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
