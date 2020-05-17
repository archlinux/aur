# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=libcprime
pkgver=2.9.0
pkgrel=1
pkgdesc="A library for bookmarking, saving recent activites, managing settings of CoreApps."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'libnotify')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('e55d393ec1eab70ce3e34cfb9e784a19')

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
