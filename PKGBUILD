# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corepdf
pkgver=2.7.0
pkgrel=1
pkgdesc="A PDF viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'poppler-qt5' 'libcprime')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('f081935f61c62381f23daf30b7a198b4')

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
