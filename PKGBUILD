# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=videodownloader
pkgname=videodownloader
pkgver=1.3.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A video downloader with Qt GUI (currently only YouTube and Vimeo are maintained)."
license=('GPL')
depends=('qtutilities' 'openssl' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('122a64f4d08caa2e1cca1dd279d4db85023d46ee9f12b041b341b8d7c33dea9d')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
