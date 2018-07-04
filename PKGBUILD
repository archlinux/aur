# Maintainer: Nils Bars <nils@nbars.de>

pkgname=cutecom
pkgver=0.45.0
pkgrel=1
pkgdesc="A graphical serial terminal"
arch=('x86_64')
url="https://github.com/neundorf/CuteCom"
license=('GPL3')
depends=('qt5-serialport')
makedepends=('cmake')
source=(${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)

build() {
  cd ${srcdir}/CuteCom-${pkgver}

  cmake .
  make || return 1
}

package() {
  cd ${srcdir}/CuteCom-${pkgver}
  install -D -m 644 cutecom.desktop ${pkgdir}/usr/share/applications/cutecom.desktop
  install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
  install -D -m 644 cutecom.1 ${pkgdir}/usr/share/man/man1/cutecom.1
}

md5sums=('65dd00e671bfbaad6d14d08c51fcfe47')
