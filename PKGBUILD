# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Based on the works of selir <seliur@lavabit.com> and
# muflax <muflax@gmail.com>

pkgname=mdk
pkgver=1.2.7
pkgrel=1
pkgdesc="An emulation of Donald Knuth's mythical MIX computer."
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/mdk/mdk.html'
license=('GPL3')
depends=('libglade' 'gtk2' 'readline')
makedepends=('intltool' 'glib2' 'texinfo')
install=mdk.install
source=("http://ftp.gnu.org/gnu/mdk/v${pkgver}/mdk-${pkgver}.tar.gz")
md5sums=('ab5ceb4363958261fd5e0614c9c11701')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
