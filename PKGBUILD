# Maintainer: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.6
pkgrel=1
pkgdesc="GNU cflow - for diagramming C program flow from sources"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cflow/"
license=('GPL')
options=('!staticlibs' 'libtool' '!emptydirs')
# install='pkgname.install'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz.sig")
sha256sums=('d5392a6d8a63ba2f41df9f88b51f97bc0452c5262762a3c27e0412a6c03c06db'
            'SKIP')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')

build() {

  cd ${srcdir}/${pkgname}-${pkgver}

  ## configure
  msg "Configuring - ${pkgname}..."
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  msg "Building - ${pkgname}..."

  make

}

package() {
  msg "Packaging - $pkgname-$pkgver"

  cd ${srcdir}/${pkgname}-${pkgver}

  make -j1 DESTDIR="$pkgdir" install

}
