# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=libcsys
pkgver=2.7.1
pkgrel=1
pkgdesc="Library for managing drive and getting system resource information in real time."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'udisks2')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('d71aec53ea754be7649b49dde7ce6f81')

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
