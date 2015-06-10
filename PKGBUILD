# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=roxterm-gtk2
pkgver=2.9.7
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator (GTK2 version)'
arch=('i686' 'x86_64')
url='http://roxterm.sourceforge.net/'
license=('GPL3')
depends=('dbus-glib' 'vte' 'hicolor-icon-theme' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
install=roxterm.install
source=("http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.bz2")
sha1sums=('b88fe4d807b5cd96128d8320793569405c4b208e')

build() {
  cd "${srcdir}/roxterm-${pkgver}"

  python2 mscript.py configure --prefix='/usr' --disable-gtk3
  python2 mscript.py build
}

package() {
  cd "${srcdir}/roxterm-${pkgver}"
  python2 mscript.py install --destdir="${pkgdir}"
}
