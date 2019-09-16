# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corearchiver
pkgver=2.7.0
pkgrel=1
pkgdesc="Archiver from the CoreApps family to create and extract archives."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime' 'libarchive-qt')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('ca93e32d4177c09e64667fb1f67b6c1c')

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
