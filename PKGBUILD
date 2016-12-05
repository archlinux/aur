# Maintainer: Nils Bars <arch@nbars.de>
 
pkgname=cutecom
pkgver=0.30.4
pkgrel=1
pkgdesc="A graphical serial terminal"
arch=('i686' 'x86_64')
url="https://github.com/neundorf/CuteCom/archive"
license=('GPL3')
depends=('qt5-serialport')
makedepends=('cmake')
source=(${url}/v${pkgver}.zip)
 
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
 
md5sums=('315c8161a45e124ce3ab3ee106e28a01')
