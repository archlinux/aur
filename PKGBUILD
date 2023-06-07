# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=gtkttk
pkgver=0.9
pkgrel=1
pkgdesc="ttk theme that gives to your Tk applications a native GTK+ look and feel."
url="https://github.com/Geballin/gtkTtk"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk' 'gtk2' 'gtk-engines' 'gdk-pixbuf-xlib')
optdepends=('ttk-theme-chooser: A graphical tool to easily change and set the default ttk theme')
makedepends=(make gcc tcl)
conflicts=()
replaces=()
backup=()
options=('!buildflags')
install=gtkttk.install
source=("https://github.com/Geballin/${pkgname}/archive/${pkgver}.tar.gz"
	"gtkttk.install")

md5sums=('4a1eb695e7c01f12bbdcbbb78e7cbace'
	 '8e103f8d598895424d5f2ac4e7e6646f')

build() {
  cd ${srcdir}/gtkTtk-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=`tclsh <<< 'puts [lindex $auto_path end]'`
  make
}

package() {
  cd ${srcdir}/gtkTtk-${pkgver}
  make DESTDIR="${pkgdir}" install
}


