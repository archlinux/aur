# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: noonov <noonov@gmail.com>

pkgname=cueplot
pkgver=0.0.8
pkgrel=7
pkgdesc="A GUI front-end to gnuplot, which uses Qt library"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/cueplot/"
license=('GPL2')
depends=('qt4' 'gnuplot')
makedepends=('cmake')
source=("https://osdn.net/projects/cueplot/downloads/43138/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('27f7a3c85b7a8a29013f30d4654cee3dbef26fd72c344456a5ff30f55c118f31')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install .
}
