# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=libcsys
pkgver=2.7.0
pkgrel=1
pkgdesc="Library for managing drive and getting system resource information in real time."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'udisks2')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('5c49c89cda7a137fce6b78414cb5ad6c')

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
