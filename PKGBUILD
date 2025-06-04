# Maintainer: Martchus <martchus@gmx.net>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Tom Nguyen <tom81094@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=mediawriter
_pkgname=MediaWriter
_author=FedoraQt
pkgver=5.2.5
pkgrel=1
pkgdesc='Fedora Media Writer - Write Fedora Images to Portable Media'
arch=('x86_64')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('xz' 'qt6-base' 'qt6-imageformats' 'qt6-tools' 'qt6-declarative' 'qt6-5compat' 'qt6-svg')
optdepends=('udisks2: Disk Management Service for disk installation')
makedepends=('cmake' 'ninja')
source=("https://github.com/${_author}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fbd0aacfa22ceab9df18cd6655191a22b9234533815db47faac0a828b07f285d')

build() {
  cmake -G Ninja -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}


package() {
  DESTDIR="$pkgdir" cmake --install build
}
