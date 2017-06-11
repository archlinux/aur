# Maintainer: Jens Adam <jra@byte.cx>

pkgname=dterm
pkgver=0.5
pkgrel=1
pkgdesc='Simple serial terminal emulator'
url='http://www.knossos.net.nz/resources/free-software/dterm/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('readline')
optdepends=('lrzsz: for X/Y/ZMODEM file transfer functionality')
source=("http://www.knossos.net.nz/downloads/${pkgname}-${pkgver}.tgz")
md5sums=('e1c576e0d229333d46567528484541b6')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -D dterm "${pkgdir}"/usr/bin/dterm
  install -D -m 0644 README.txt "${pkgdir}"/usr/share/doc/dterm/README.txt
}
