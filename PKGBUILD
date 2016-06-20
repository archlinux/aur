# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=mdk
pkgver=1.2.9
pkgrel=1
pkgdesc="An emulation of Donald Knuth's mythical MIX computer."
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/mdk/mdk.html'
license=('GPL3')
depends=('guile' 'libglade')
makedepends=('intltool' 'glib2')
source=("http://ftp.gnu.org/gnu/mdk/v${pkgver}/mdk-${pkgver}.tar.gz")
sha256sums=('6c265ddd7436925208513b155e7955e5a88c158cddda72c32714ccf5f3e74430')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
