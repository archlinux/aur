# Maintainer: Nils Bars <nils@nbars.de>

pkgname=cutecom
pkgver=0.50.0
pkgrel=0
pkgdesc="A graphical serial terminal"
arch=('x86_64')
url="https://gitlab.com/cutecom/cutecom"
license=('GPL3')
depends=('qt5-serialport')
makedepends=('cmake')
source=(${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/cutecom-v${pkgver}.tar.gz)

build() {
  cd ${srcdir}/cutecom-v${pkgver}

  cmake .
  make || return 1
}

package() {
  cd ${srcdir}/cutecom-v${pkgver}
  install -D -m 644 cutecom.desktop ${pkgdir}/usr/share/applications/cutecom.desktop
  install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
  install -D -m 644 cutecom.1 ${pkgdir}/usr/share/man/man1/cutecom.1
}

md5sums=('17062fcb0c063e496c09f0255e471268')
