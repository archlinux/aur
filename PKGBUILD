# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corepdf
pkgver=4.0.0
pkgrel=1
pkgdesc="A PDF viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'poppler-qt5' 'libcprime>=2.7.1')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('f34c7b9a9784c0bbced196e9c4d3f52a')

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
