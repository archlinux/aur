# Maintainer: Martchus <martchus@gmx.net>
_reponame=passwordfile
pkgname=passwordfile
pkgver=3.1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="C++ library to read/write passwords from/to encrypted files (using AES-256-CBC via OpenSSL)."
license=('GPL')
depends=('c++utilities' 'openssl')
makedepends=('cmake')
install=
url="https://github.com/Martchus/${_reponame}"
source=("passwordfile-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('b52beffef5a7c941ae4fc5dc6d1dc62cb12839eabbb5ea39c59c3fb6497b025a')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}
