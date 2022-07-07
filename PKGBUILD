# Maintainer: Mansour Behabadi <mansour@oxplot.com>
# Contributor: Alex Mekkering <amekkering at gmail dot com>

pkgname=whsniff-git
pkgver=1.1.r38.4894032
pkgrel=1
pkgdesc="A command line utility that interfaces TI CC2531 USB dongle with Wireshark for capturing and displaying IEEE 802.15.4 traffic at 2.4 GHz."
arch=('x86_64')
url='https://github.com/homewsn/whsniff'
license=('GPL')
depends=('libusb')
provides=("whsniff=${pkgver}")
conflicts=('whsniff')
replaces=('whsniff<=1.1.r18')
makedepends=('sed')
source=( "${pkgname}::git+https://github.com/homewsn/whsniff.git" )
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
