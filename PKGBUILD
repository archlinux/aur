# Maintainer: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.4
pkgrel=1
pkgdesc="The GNU cflow - for diagramming program flow"
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
md5sums=('3d1bb6ae5cb6c31311b5fcead625dd57')

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

#   cd ${srcdir}/build  # cmake
  cd ${srcdir}/${pkgname}            # use for non-out-of-source

  make -j1 DESTDIR="$pkgdir" install
#   make INSTALL_ROOT="${pkgdir}" install  # other form
}
