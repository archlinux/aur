# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=coreaction
pkgver=2.9.0
pkgrel=1
pkgdesc="A side bar for showing widgets from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'libcprime>=2.7.1' 'libcsys>=2.7.1')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('7269811ae7ad999fce3a7f530c7883c7')

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
