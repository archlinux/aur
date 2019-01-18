# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=mdk
pkgver=1.2.10
pkgrel=1
pkgdesc="An emulation of Donald Knuth's mythical MIX computer."
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/mdk/mdk.html'
license=('GPL3')
depends=('guile2.0' 'libglade')
makedepends=('glib2' 'intltool')
source=("http://ftp.gnu.org/gnu/mdk/v${pkgver}/mdk-${pkgver}.tar.gz")
sha512sums=('caa39769fa60ca8dc4e9edab0d625425941f70c5e5d923f9c80c8c784a00e1a70582852906711838539817ad21880e6827a0a75fe16da85ee1bd0bd08aca1700')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
