# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corestuff
pkgver=2.7.0
pkgrel=1
pkgdesc="An activity viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libcsys' 'libcprime' 'libxcomposite')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('3dcf420cb7e0c046d81b97704eb1279e')

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
