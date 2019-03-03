# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.12.1
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('i686' 'x86_64')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils')
makedepends=('qt5-tools')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=("32b07c5fd7c36b26add252786163159d45d124cd23c64791a0d4c966a2941acdb33c68ed8df54d8623d10580bb53fcfce668f4018682e29a5101ce3e78b0d8c9")

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
}
