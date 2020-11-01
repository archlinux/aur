# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=mdk
pkgver=1.3.0
pkgrel=1
pkgdesc="An emulation of Donald Knuth's mythical MIX computer."
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/mdk/mdk.html'
license=('GPL3')
depends=('guile' 'gtk3')
makedepends=('glib2' 'intltool')
source=("https://ftp.gnu.org/gnu/mdk/v${pkgver}/mdk-${pkgver}.tar.gz")
b2sums=('19263eafd65b753e5059c4676f2163d151d4f5231ac6257a8b59f419eb3a5ca9a8167db9cdcd1fc7455c7bb8652c5192dd7fea07f4048dcd95ac669ec4c10c43')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
