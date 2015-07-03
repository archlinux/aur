# Maintainer: codestation <codestation404@gmail.com>

pkgname=qcma-kdenotifier
_pkgname=qcma
pkgver=0.3.9
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita (KDE notifier)"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
depends=('qcma>=0.3.9' 'knotifications')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('46cdc03c9b1ad1ce7905dc194166291a917aee0deb38099f998914076e88c30d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake-qt5 qcma_kdenotifier.pro PREFIX="/usr" CONFIG+=ENABLE_KNOTIFICATIONS
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
