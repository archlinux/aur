# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=dbus-soundrecorder
pkgname=dbus-soundrecorder
pkgver=1.2.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Records sound from Pulse Audio using ffmpeg while watching D-Bus to determine tracks and meta data."
license=('GPL')
depends=('c++utilities' 'qt5-base')
makedepends=('cmake' 'qtutilities')
url="https://github.com/Martchus/${_reponame}"
source=("dbus-soundrecorder-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0916dd0282447add537900472f2ef35c5f26feefb2fdb41a3a3d39fcabd226d8')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
