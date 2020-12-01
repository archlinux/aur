# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=libcprime
pkgver=4.1.0
pkgrel=1
pkgdesc="A library for bookmarking, saving recent activites, managing settings of CoreApps."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'libnotify')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('3222024b5ecc04230c7a906856b8b9e4')

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
