# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=grits-git
provides=('grits')
pkgver=0.8.1
pkgrel=1
pkgdesc="Virtual Globe library using GTK+ and OpenGL"
arch=('aarch64' 'x86_64')
url="http://pileus.org/aweather/grits"
license=('GPL3')
depends=('gtk2' 'libsoup' 'libglvnd' 'glu')
options=('!libtool')
source=('git+https://github.com/i3Craig/grits.git')
sha512sums=('SKIP')

prepare() {
  cd grits
   ./configure --prefix=/usr LIBS=-lgmodule-2.0
}

build() {
  cd grits
  make
}

package() {
  cd grits
  make DESTDIR="${pkgdir}" install
}
