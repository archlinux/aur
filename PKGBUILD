# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=roxterm-gtk2
pkgver=2.8.3
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator (GTK2 version)'
arch=('i686' 'x86_64')
url='http://roxterm.sourceforge.net/'
license=('GPL3')
depends=('dbus-glib' 'vte' 'hicolor-icon-theme')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
install=roxterm.install
source=("http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.bz2")
md5sums=('0f775a11f01e38be22ae5a080800c5f7')

build() {
  cd "${srcdir}/roxterm-${pkgver}"

  python2 mscript.py configure --prefix='/usr' --disable-gtk3
  python2 mscript.py build
}

package() {
  cd "${srcdir}/roxterm-${pkgver}"
  python2 mscript.py install --destdir="${pkgdir}"
}
