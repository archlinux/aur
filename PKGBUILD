# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=whsniff
_pkgver=1.1
pkgver=1.1.r10.920e107
pkgrel=2
pkgdesc="A command line utility that interfaces TI CC2531 USB dongle with Wireshark for capturing and displaying IEEE 802.15.4 traffic at 2.4 GHz."
arch=('x86_64')
url='https://github.com/homewsn/whsniff.git'
license=('GPL')
depends=('libusb')
makedepends=('sed')
source=( "${pkgname}::git+https://github.com/homewsn/whsniff.git" )
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install PREFIX=${pkgdir} BINDIR=${pkgdir}/usr/bin
}
