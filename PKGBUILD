# Maintainer: Anders Thomsen <thomsen dot anders at gmail dot com>

pkgname=openkj-git
_pkgname=openkj
pkgver=latest
pkgrel=1
pkgdesc="Open KJ - Cross-platform open source karaoke hosting software"
arch=('i686' 'x86_64')
url="https://openkj.org/"
license=('GPL3')
depends=('qt5-multimedia' 'gst-plugins-good' 'taglib-extras')
makedepends=('qt5-tools' 'git')
provides=("$_pkgname=$pkgver")
conflicts=('openkj')
install=${_pkgname}.install
source=("git+https://github.com/OpenKJ/OpenKJ.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/OpenKJ"
  cmake CMakeLists.txt
  make
}

package() {
  cd "${srcdir}/OpenKJ"
  make DESTDIR="$pkgdir" install
}
