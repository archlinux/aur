# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corestuff
pkgver=4.1.0
pkgrel=1
pkgdesc="An activity viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxcomposite' 'kglobalaccel' 'libcsys>=2.7.1' 'libcprime>=2.7.1')
replaces=('corebox')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('7dbf40c62e221a4c71c03e11b32ff031')

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
} 
