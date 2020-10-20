# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=mdk
pkgver=1.2.11
pkgrel=1
pkgdesc="An emulation of Donald Knuth's mythical MIX computer."
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/mdk/mdk.html'
license=('GPL3')
depends=('guile2.0' 'libglade')
makedepends=('glib2' 'intltool')
source=("https://ftp.gnu.org/gnu/mdk/v${pkgver}/mdk-${pkgver}.tar.gz")
b2sums=('11d6566c26ca8969d3973020f26428eee0bc26e9f7825502388ade7796f1617fbea410ecb15f998213a6bf4fdb292486f8d1c5dd35c729c683fd642a3d69d03d')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
