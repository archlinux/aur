# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=1.4.0
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('eigen3')
makedepends=('cmake')
source=(https://github.com/orocos/orocos_kinematics_dynamics/archive/v${pkgver}.tar.gz)
sha512sums=('7156465e2aff02f472933617512069355836a03a02d4587cfe03c1b1d667a9762a4e3ed6e055b2a44f1fce1b6746179203c7204389626a7b458dcab1b28930d8')

build() {
  cd "${srcdir}/orocos_kinematics_dynamics-${pkgver}/orocos_kdl"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/orocos_kinematics_dynamics-${pkgver}/orocos_kdl"
	
  make DESTDIR="${pkgdir}" install
}

