# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=gtkttk
pkgver=0.5
pkgrel=2
pkgdesc="ttk theme that gives to your Tk applications a native GTK+ look and feel."
url="https://github.com/Geballin/gtkTtk"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk' 'gtk2' 'gtk-engines' 'ttk-theme-chooser')
optdepends=()
makedepends=(make gcc tcl)
conflicts=()
replaces=()
backup=()
options=('!buildflags')
install=gtkttk.install
source=("https://github.com/Geballin/${pkgname}/archive/${pkgver}.tar.gz"
	"gtkttk.install")

md5sums=('f712952cbfd2e6de05879c7b97f3af24'
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
