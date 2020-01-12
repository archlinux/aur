# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corestuff
pkgver=2.8.0
pkgrel=1
pkgdesc="An activity viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libcsys>=2.7.1' 'libcprime>=2.7.1' 'libxcomposite')
replaces=('corebox')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('9e7bf18cc80e4aa65a176407859b0b97')

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
