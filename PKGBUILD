# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com> 

pkgname=libindi_ardust4
pkgver=0.1
pkgrel=4
pkgdesc="INDI driver for an Arduino USB/ST-4 Interface"
url="https://github.com/tliff/indi_ardust4"
license=(GPL2)
arch=(i686 x86_64)
depends=()
makedepends=(cmake)
source=("https://github.com/tliff/indi_ardust4/archive/v${pkgver}.tar.gz"
  "indi_ardust4.xml")
sha256sums=('b3ea2e6e4971989aabe9421371ebc3da5b22803afbdf19f3ec8b9a33cbb8769d'
            'feca490bc85c2f95ccb9d2e82112eca383f4fe89d344d69f59eddab95d7d0ba3')

build() {
  cd ${srcdir}/indi_ardust4-${pkgver}
  cmake .
  make
}

package() {
  cd ${srcdir}/indi_ardust4-${pkgver}
  install -D --target-directory "$pkgdir/usr/bin/" indi_ardust4
  install -D --target-directory "$pkgdir/usr/share/indi/" ../indi_ardust4.xml
}
