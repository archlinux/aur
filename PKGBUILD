# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=coretime
pkgver=2.7.0
pkgrel=1
pkgdesc="A time related task manager from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime' 'qt5-multimedia')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('f9abb7c63b1c4ea39da31c338f358a58')

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
