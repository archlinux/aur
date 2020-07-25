# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=1.4.0
pkgrel=2
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="https://www.orocos.org/kdl"
license=('GPL')
depends=(eigen)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/orocos/orocos_kinematics_dynamics/archive/v${pkgver}.tar.gz")
sha256sums=('05b93e759923684dc07433ccae1e476d158d89b3c2be5079c20062406da7b4dd')

_dir=orocos_kinematics_dynamics
_pkgname=orocos_kdl

build() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
