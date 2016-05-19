# Maintainer: Nils Bars <arch@nbars.de>

pkgname=cutecom
pkgver=0.22.0
pkgrel=1
pkgdesc="A graphical serial terminal"
arch=('i686' 'x86_64')
url="http://cutecom.sourceforge.net"
license=('GPL2')
depends=('qt4')
makedepends=('cmake')
source=(${url}/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake -DQT_QMAKE_EXECUTABLE=qmake4 .
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m 644 cutecom.desktop ${pkgdir}/usr/share/applications/cutecom.desktop
  install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
  install -D -m 644 cutecom.1 ${pkgdir}/usr/share/man/man1/cutecom.1
}

md5sums=('dd85ceecf5a60b4d9e4b21a338920561')
sha256sums=('1b6620a6159cf3d50bb36cce544e91486817df7f1d553bf239d6db6108dd2ea5')
