# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corekeyboard
pkgver=2.7.1
pkgrel=1
pkgdesc="A virtual keyboard for X11 from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime>=2.7.1' 'qt5-x11extras' 'libxtst' 'libx11')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('f203b456db1041a4d152c3e349c0cebe')

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
