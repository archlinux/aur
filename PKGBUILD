pkgname=qolibri
pkgver=2.1.0
pkgrel=1
pkgdesc="A QT-based EPWING dictionary viewer"
url="https://github.com/ludios/qolibri/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-webkit' 'zlib' 'eb-library')
source=("https://github.com/ludios/qolibri/archive/${pkgver}.tar.gz")
md5sums=('8e4ebb169c8fed34899fe3aa1ae1e5ba')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make -j4
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
