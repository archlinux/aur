# Maintainer: oysstu <oysstu a gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=1.5.3
pkgrel=2
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
url="https://www.orocos.org/kdl.html"
arch=('any')
license=('LGPL-2.1-or-later')
depends=('eigen')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/orocos/orocos_kinematics_dynamics/archive/${pkgver}.tar.gz")
sha256sums=('3895eed1b51a6803c79e7ac4acd6a2243d621b887ac26a1a6b82a86a1131c3b6')

_dir=orocos_kinematics_dynamics
_pkgname=orocos_kdl

build() {
  cmake -B build -S "${srcdir}/${_dir}-${pkgver}/${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_TESTS:BOOL=OFF \
    -DENABLE_EXAMPLES:BOOL=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
