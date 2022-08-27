# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=gtkttk
pkgver=0.8
pkgrel=1
pkgdesc="ttk theme that gives to your Tk applications a native GTK+ look and feel."
url="https://github.com/Geballin/gtkTtk"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk' 'gtk2' 'gtk-engines' 'ttk-theme-chooser' 'gdk-pixbuf-xlib')
optdepends=()
makedepends=(make gcc tcl)
conflicts=()
replaces=()
backup=()
options=('!buildflags')
install=gtkttk.install
source=("https://github.com/Geballin/${pkgname}/archive/${pkgver}.tar.gz"
	"gtkttk.install")

md5sums=('b52e00c882c039793e8f71a636e7c814'
	 '4f10456c19a4943f7688014ee5020b46')

build() {
  cd ${srcdir}/gtkTtk-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=`tclsh <<< 'puts [lindex $auto_path end]'`
  make
}

package() {
  cd ${srcdir}/gtkTtk-${pkgver}
  make DESTDIR="${pkgdir}" install
}
