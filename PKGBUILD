# Maintainer: Mark J. Skinner <marks@cinfinity.info>
pkgname=stdconfig
pkgver=0.3
pkgrel=1
pkgdesc="A standard configuration library, similar to glibc's getopt."
arch=('i686' 'x86_64')
url="https://www.cinfinity.info/"
license=('GPL2')
depends=()
provides=('libstdconfig.so=4-64')
source=("https://www.cinfinity.info/src/${pkgname}_$pkgver.tar.xz" "https://www.cinfinity.info/src/${pkgname}_$pkgver.tar.xz.sig")
sha256sums=('6160f76fdd6a7a771f90208731d523233bce364bd1ccf7a8d5761fd3029b7bbe'
            'SKIP')
validpgpkeys=('337DBBBAB93B197BE445AF267EEF69820728EB48')

build() {
  cd "${pkgname}_$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-boot-dirs
  make
}

package() {
  cd "${pkgname}_$pkgver"

  make DESTDIR="$pkgdir/" install
}
