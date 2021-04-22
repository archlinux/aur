# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Tom Nguyen <tom81094@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=mediawriter
_pkgname=MediaWriter
_author=FedoraQt
pkgver=4.2.1
pkgrel=1
pkgdesc='Fedora Media Writer - Write Fedora Images to Portable Media'
arch=('x86_64')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('xz' 'qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-svg'
         'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-x11extras' 'adwaita-qt')
optdepends=('udisks2: Disk Management Service for disk installation')
makedepends=('cmake' 'ninja')
source=("https://github.com/${_author}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a637c43a8d72d8058fad14ce1b7ffad544c5611d644b6203f916fc41de731f0c')

build() {
  cmake -G Ninja -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}


package() {
  DESTDIR="$pkgdir" cmake --install build
}
