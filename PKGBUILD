# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=coretoppings
pkgver=2.8.0
pkgrel=1
pkgdesc="Additional features,plugins etc for CuboCore Application Suite."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-location' 'qt5-x11extras' 'qt5-connectivity' 'libpulse' 'libcprime')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('a1c191e436edbc617b27cd545bba89f3')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
