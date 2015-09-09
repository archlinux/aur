# Maintainer: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.4
pkgrel=1
pkgdesc="The GNU cflow - for diagramming C program flow from sources"
arch=('i686' 'x86_64')
url="http://ftp.gnu.org/gnu/cflow/cflow-1.4.tar.xz"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
options=('staticlibs' 'libtool' '!emptydirs')
# install='pkgname.install'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
md5sums=('b76b3b50588ec73824342f78379b4e0f')

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
