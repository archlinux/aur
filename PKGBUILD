# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Nils Bars <nils@nbars.de>

pkgname=cutecom
pkgver=0.51.0
pkgrel=1
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
  install -D -m 644 images/cutecom.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutecom.svg
  install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
  install -D -m 644 cutecom.1 ${pkgdir}/usr/share/man/man1/cutecom.1
}

md5sums=('bcc5d13ab5c70f1e343ad32b57c9618c')
