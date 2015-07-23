# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=1.3.0
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('eigen3')
makedepends=('cmake')
source=(https://github.com/orocos/orocos_kinematics_dynamics/archive/v${pkgver}.tar.gz)
md5sums=('dc927de422cf6afe716ec7b12c0eed11')
sha256sums=('7be2dd5e4f4c1ceac2cdf1f4fae3d94d4ffd9fc1af8d483c05f04e80ef84b3f9')
sha384sums=('78e82b4b42e4135906ed7d4bc1cb4579b0732c22dea8bb23c4f38ae5782887fd490f51d9a1675d8142de97a76de157eb')
sha512sums=('09ff63f74f1eac3ee8b1090364e0d95b4ae96c9d4435ca34adacb3ded7385f948ddca9be2c1c2c2214c9342b17bbffb7da89ba9b7cd402e7fd4f2c6dbd06a930')

build() {
  cd "${srcdir}/orocos_kinematics_dynamics-${pkgver}/orocos_kdl"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/orocos_kinematics_dynamics-${pkgver}/orocos_kdl"
	
  make DESTDIR="${pkgdir}" install
}

