# Maintainer: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.6
pkgrel=0
pkgdesc="GNU cflow - for diagramming C program flow from sources"
arch=('i686' 'x86_64')
url="http://ftp.gnu.org/gnu/cflow/cflow-1.5.tar.xz"
license=('GPL')
options=('staticlibs' 'libtool' '!emptydirs')
# install='pkgname.install'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
md5sums=('4c8e02bb8d0b35c965559f0c8d42af84')

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
