# Maintainer: Martchus <martchus@gmx.net>
_reponame=videodownloader
pkgname=videodownloader
pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A video downloader with Qt GUI (currently only YouTube and Vimeo are maintained)."
license=('GPL')
depends=('qtutilities' 'openssl' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0680db3887715f6147247d2344745794fac6d6d57daf0173c8e2ac29b5392e30')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}
