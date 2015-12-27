# Maintainer: Martchus <martchus@gmx.net>
_reponame=passwordmanager
pkgname=passwordmanager
pkgver=2.1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A simple password store using AES-256-CBC encryption via OpenSSL."
license=('GPL')
depends=('qt5-base' 'qtutilities' 'passwordfile' 'openssl' 'libxkbcommon-x11' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("passwordmanager-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('85b436cf43d1bc9cd83ef1f756d85870b3c066aa1103ef290a364ed0c642e907')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}
