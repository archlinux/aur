# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=akonadi-ews
pkgver=0.8.0
pkgrel=3
pkgdesc="Resource agent for Microsoft Exchange using Exchange Web Services (EWS) protocol"
arch=('i686' 'x86_64')
url="https://github.com/KrissN/akonadi-ews/"
license=('GPL')
depends=('kcalcore' 'akonadi-mime' 'hicolor-icon-theme' 'kcontacts')
makedepends=('extra-cmake-modules' 'boost' 'kdesignerplugin')
source=("https://github.com/KrissN/akonadi-ews/archive/v${pkgver}.tar.gz")
sha256sums=('29424e8f02e739f0fa0fa657ef4a0d597b91bc0907c575db44d77d399590b76c')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
