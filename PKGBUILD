# Maintainer: Colin Pitrat <colin dot pitrat at gmail dot com>
pkgname=althreat-git
pkgver=r49.168242f
pkgrel=1
pkgdesc="A C++/SDL shoot'em up"
arch=('i686' 'x86_64')
url="https://github.com/ColinPitrat/althreat"
license=('GPL2')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
source=(git://github.com/ColinPitrat/althreat/)
sha256sums=('SKIP')

pkgver() {
  cd althreat
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd althreat
  ./configure --prefix=/usr
  make
}

package() {
  cd althreat
  make DESTDIR="$pkgdir/" install
}
