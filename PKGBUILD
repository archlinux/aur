# Maintainer: Jens Adam <jra@byte.cx>

pkgname=dterm
pkgver=0.3
pkgrel=2
pkgdesc='Simple serial terminal emulator'
url='http://www.knossos.net.nz/resources/free-software/dterm/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
optdepends=('lrzsz: for X/Y/ZMODEM file transfer functionality')
source=("http://www.knossos.net.nz/downloads/${pkgname}-${pkgver}.tgz")
md5sums=('4044341cf3b8e12559f8f25c9e428042')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -D dterm "${pkgdir}"/usr/bin/dterm
  install -Dm644 README.txt "${pkgdir}"/usr/share/doc/dterm/README.txt
}
