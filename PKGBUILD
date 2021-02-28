# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Tom Nguyen <tom81094@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=mediawriter
_pkgname=MediaWriter
_author=FedoraQt
pkgver=4.2.0
pkgrel=1
pkgdesc='Fedora Media Writer - Write Fedora Images to Portable Media'
arch=('any')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('xz' 'qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-svg'
         'qt5-quickcontrols2' 'qt5-x11extras' 'adwaita-qt')
optdepends=('udisks2: Disk Management Service for disk installation')
source=("https://github.com/${_author}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('af1749bed4bd335573928630ad6e78e54a2cb6bbfcb9011cc2ebf98942a34f28')

build() {
  cd "${_pkgname}-${pkgver}"

  qmake-qt5 PREFIX=/usr .
  make
}


package() {
  cd "${_pkgname}-${pkgver}"

  INSTALL_ROOT="${pkgdir}" make install
}
