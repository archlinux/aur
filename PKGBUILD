# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=videodownloader
pkgname=videodownloader
pkgver=1.3.3
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='A video downloader with Qt GUI (currently only YouTube and Vimeo are maintained)'
license=('GPL')
depends=('qtutilities' 'openssl' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'qt5-tools' 'mesa')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('60cb2e5e11a7665765dfe8904f51759bdef88b6d11cd93f9b83fab868f9c09e8')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
