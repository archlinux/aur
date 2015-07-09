# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Matz Radloff <matzradloff@googlemail.com>

pkgname=massif-visualizer
pkgver=0.4.0
pkgrel=1
pkgdesc="Visualizer for Valgrind Massif data files."
arch=(i686 x86_64)
url="https://projects.kde.org/projects/extragear/sdk/massif-visualizer"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'kgraphviewer')
optdepends=('kgraphviewer: call graph tab')
source=("http://download.kde.org/stable/massif-visualizer/${pkgver}/src/massif-visualizer-${pkgver}.tar.xz")
sha256sums=('e81f4bd93f0568fdb8c58f165c63c11c16060906e7c3892f933e1f4ecbfd5c79')

build() {
  cd "massif-visualizer-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "massif-visualizer-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
