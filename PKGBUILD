# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>

pkgname=pcb2gcode
pkgver=1.3.2
pkgrel=1
pkgdesc="Gerber to gcode file converter" 
arch=('i686' 'x86_64')
url="https://github.com/pcb2gcode/pcb2gcode/wiki"
license=('GPL')
depends=('boost-libs' 'gtkmm' 'gerbv-git')
source=("https://github.com/pcb2gcode/pcb2gcode/releases/download/v${pkgver}/pcb2gcode-${pkgver}.tar.gz")
md5sums=('60fb7e9878f082992a95359356d609b6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -i
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
