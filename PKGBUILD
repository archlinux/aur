# Maintainer: Søren Poulsen <nikorpoulsen@gmail.com>
# Contributor: Søren Poulsen <nikorpoulsen@gmail.com>
pkgname=pcb2gcodegui
pkgver="r65.a28612f"
pkgrel=1
pkgdesc="A GUI for pcb2gcode."
url="https://github.com/pcb2gcode/pcb2gcodeGUI"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt5-svg' 'pcb2gcode')
makedepends=('git')
source=("$pkgname"::'git://github.com/pcb2gcode/pcb2gcodeGUI.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  qmake PREFIX="$pkgdir/usr"
}

build ()
{
  cd "$srcdir/$pkgname"
  make 
}

package()
{
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install 
}
