# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com> 

pkgname=libindi_ardust4
pkgver=1.0.0
pkgrel=1
pkgdesc="INDI driver for an Arduino USB/ST-4 Interface"
url="https://github.com/tliff/indi_ardust4"
license=(GPL2)
arch=(i686 x86_64)
depends=()
makedepends=(cmake)
source=("https://github.com/tliff/indi_ardust4/archive/master.zip"
  "indi_ardust4.xml")
sha256sums=('ac85f0de095fd79160f5591e3ff86fbd3c2b7e950d97576cadf266cee93e90f8'
            'feca490bc85c2f95ccb9d2e82112eca383f4fe89d344d69f59eddab95d7d0ba3')

build() {
  cd ${srcdir}/indi_ardust4-master
  cmake .
  make
}

package() {
  cd ${srcdir}/indi_ardust4-master
  install -D --target-directory "$pkgdir/usr/bin/" indi_ardust4
  install -D --target-directory "$pkgdir/usr/share/indi/" ../indi_ardust4.xml
}
