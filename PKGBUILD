# Maintainer: tuxflo

pkgname=timekeeper-git
pkgver=1
pkgrel=1
pkgdesc="Plasma time tracking applet"
arch=('i686' 'x86_64')
url="https://github.com/grulja/plasma-timekeeper"
license=('gpl-2.0')
depends=('cmake' 'plasma-desktop')
source=('timekeeper::git+https://github.com/grulja/plasma-timekeeper')

md5sums=('SKIP')

build() {
  cd "${srcdir}/timekeeper"
  mkdir "${srcdir}/timekeeper/build"
  cd "${srcdir}/timekeeper/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DQML_INSTALL_DIR:PATH="/usr/lib/qt/qml"
  make
}

package() {
  #install -dm755 "${pkgdir}/usr/bin"
  cd "${srcdir}/${pgkname}/timekeeper/build"
  make DESTDIR="$pkgdir/" install
}
