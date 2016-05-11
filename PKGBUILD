# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2016.04.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('928e1b2566f60ec5e9316e1876fba37bf267da50c596178454f3be3e9be1a784')
sha512sums=('055eb29dcdbfec23a89ba1db28b79b6caf1509e8374edb1f890b41d4dac5fed63e121967a46414191afd81fbcbf9ee380ad3bc6f03afed5d1490d3684f190379')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
