# Maintainer: Jason Gerecke <killertofu@gmail.com> 
pkgname=i4oled-gui-git
pkgver=20140916
pkgrel=1
pkgdesc="A showcase of graphical user interface for setting OLEDs on Wacom Intuos4 tablets"
arch=('i686' 'x86_64')
url="https://github.com/PrzemoF/i4oled-gui"
license=('GPL3')
depends=('gtk3' 'dconf')
makedepends=('git' 'gcc')
source=("${pkgname}::git+https://github.com/PrzemoF/i4oled-gui.git")
md5sums=('SKIP')


build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
