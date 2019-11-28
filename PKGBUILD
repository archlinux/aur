pkgname=coin-or-coinmumps
pkgver=1.6.1
pkgrel=1
pkgdesc="COIN-OR autotools harness to build MUMPS"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-MUMPS/"
license=('custom')
groups=('coin-or')
depends=('coin-or-coinmetis' 'blas')
makedepends=('gcc-fortran' 'wget')
source=("https://github.com/coin-or-tools/ThirdParty-Mumps/archive/releases/$pkgver.tar.gz")
sha256sums=('394e44905a418c2162f75e46dbaeecbba9237d3dc8e179c4c55ece83b30e051a')

prepare () {
  cd "ThirdParty-Mumps-releases-$pkgver"
  ./get.Mumps
}

build() {
  cd "ThirdParty-Mumps-releases-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
    cd "ThirdParty-Mumps-releases-$pkgver"
    PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
    make DESTDIR="${pkgdir}" install
}
