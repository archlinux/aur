# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corepdf
pkgver=2.8.0
pkgrel=1
pkgdesc="A PDF viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'poppler-qt5' 'libcprime>=2.7.1')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('658c78d5e4a8bea68f5f4062d7914c3b')

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
