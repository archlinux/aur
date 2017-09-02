# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=1.3.1
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('eigen3')
makedepends=('cmake')
source=(https://github.com/orocos/orocos_kinematics_dynamics/archive/v${pkgver}.tar.gz)
sha512sums=('93abd9dd5aef3710f784f9db8eea4738458bffa5295923993e2d77656c18f7354559412fb7eb5f1e9da7112de19aa36d3f0f68f149852f955bce960fd3b719e7')

build() {
  cd "${srcdir}/orocos_kinematics_dynamics-${pkgver}/orocos_kdl"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/orocos_kinematics_dynamics-${pkgver}/orocos_kdl"
	
  make DESTDIR="${pkgdir}" install
}

