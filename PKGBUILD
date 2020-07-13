# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=qtscrob
pkgver=0.11
pkgrel=1
pkgdesc='A tool for submitting from portable players to Last.fm & Libre.fm'
arch=('x86_64')
url='http://qtscrob.sourceforge.net'
license=('GPL2')
provides=('qtscrobbler')
depends=('qt4' 'libmtp')
makedepends=('qt4')
source=("${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/qtscrob/files/qtscrob/${pkgver}/qtscrob-${pkgver}.tar.bz2/download")
sha256sums=('01c8e48f616ed09504833d27d92fd62f455bd645ea2d1cc2a5f4c287d641daba')

build() {
  cd "${pkgname}-${pkgver}/src"
  rm -rf build
  mkdir -p build
  cd build
  qmake-qt4 PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/src/build"
  make INSTALL_ROOT="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: