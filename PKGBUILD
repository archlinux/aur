# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Tom Nguyen <tom81094@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=mediawriter
_pkgname=MediaWriter
_author=FedoraQt
pkgver=4.1.6
pkgrel=1
pkgdesc='Fedora Media Writer - Write Fedora Images to Portable Media'
arch=('any')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('xz' 'qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-svg'
         'qt5-quickcontrols' 'qt5-x11extras')
optdepends=('udisks2: Disk Management Service for disk installation')
source=("https://github.com/${_author}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('41c24444dde3af30662fd0c83b41914b6f0502d30122bd0b77bf67f56b7f1273')

build() {
  cd "${_pkgname}-${pkgver}"

  qmake-qt5 PREFIX=/usr .
  make
}


package() {
  cd "${_pkgname}-${pkgver}"

  INSTALL_ROOT="${pkgdir}" make install
}
