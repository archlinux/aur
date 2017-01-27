pkgname=cbang-git
pkgver=1.0.1.r229.g3335df9
pkgrel=3
pkgdesc="a library of cross-platform C++ utilities"
arch=('any')
url="https://github.com/CauldronDevelopmentLLC/cbang.git"
license=('GNU GPL v2.1')
depends=('scons'
	'chakracore-cauldron-git'
	'boost-libs'
	'openssl'
	'libmariadbclient')
source=("git+https://github.com/CauldronDevelopmentLLC/cbang")
md5sums=('SKIP')

pkgver() {
  cd cbang
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd cbang
  export CHAKRA_CORE_HOME="/opt/chakracore-cauldron-git"
  scons
}

package() {
  mkdir -p ${pkgdir}/opt
  cp -a ${srcdir}/cbang "${pkgdir}/opt/${pkgname}"
}

