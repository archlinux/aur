# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=mdk
pkgver=1.2.9
pkgrel=2
pkgdesc="An emulation of Donald Knuth's mythical MIX computer."
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/mdk/mdk.html'
license=('GPL3')
depends=('guile2.0' 'libglade')
makedepends=('glib2' 'intltool')
source=("http://ftp.gnu.org/gnu/mdk/v${pkgver}/mdk-${pkgver}.tar.gz")
sha512sums=('76f1a607a029183de328684dd7addc776317cec02330dd0ce6224d47ee98774d4f618a18d70960b8070c2e7d0d75a10712da848136709fd0e1ac1da6da88fe8f')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
