# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>

pkgname=pcb2gcode
pkgver=2.5.0
pkgrel=1
pkgdesc="Command-line tool for isolation, routing and drilling of PCBs."
arch=('i686' 'x86_64')
url="https://github.com/pcb2gcode/pcb2gcode"
license=('GPL')
depends=('boost-libs' 'gtkmm' 'glibmm' 'gerbv')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96f1b1b4fd58e86f152b691202a15593815949dc9250fab9ab02f2346f5c2c52')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoupdate
  autoreconf -i
}

build() {
  cd "${pkgname}-${pkgver}"
  #autoupdate
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
