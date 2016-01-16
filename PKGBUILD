# Maintainer: codestation <codestation404@gmail.com>

pkgname=qcma-kdenotifier
_pkgname=qcma
pkgver=0.3.10
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita (KDE notifier)"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
depends=('qcma>=0.3.10' 'knotifications')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('79c84d33eb9db7beaff46aa3811b85a55b6d15abde27cc6c0c7b2a22d0ad184e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake-qt5 kdenotifier/kdenotifier.pro PREFIX="/usr" CONFIG+=ENABLE_KNOTIFICATIONS
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
