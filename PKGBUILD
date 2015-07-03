# Maintainer: codestation <codestation404@gmail.com>

pkgname=qcma
pkgver=0.3.9
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
makedepends=('qt5-tools')
depends=('qt5-base' 'libvitamtp>=2.5.5' 'ffmpeg' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${pkgname}/archive/v${pkgver}.tar.gz")
install=qcma.install
sha256sums=('46cdc03c9b1ad1ce7905dc194166291a917aee0deb38099f998914076e88c30d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  lrelease-qt5 resources/translations/*.ts
  qmake-qt5 qcma.pro PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
