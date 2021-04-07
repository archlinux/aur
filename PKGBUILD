# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Søren Poulsen <nikorpoulsen@gmail.com>

pkgname=pcb2gcodegui
_pkgname=pcb2gcodeGUI
pkgver=1.3.3
pkgrel=1
pkgdesc="A GUI for pcb2gcode."
url="https://github.com/pcb2gcode/pcb2gcodeGUI"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt5-svg' 'pcb2gcode')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a1bdd990906cd5df3277f584a932d22bcc7d096acb15276b533f1d500c53712')

prepare() {
  cd "${_pkgname}-${pkgver}"
  qmake PREFIX="$pkgdir/usr"
}

build () {
  cd "${_pkgname}-${pkgver}"
  make 
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install 
}
