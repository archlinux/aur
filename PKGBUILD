# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=roxterm-gtk2
pkgver=2.9.7
pkgrel=2
pkgdesc='Tabbed, VTE-based terminal emulator (GTK2 version)'
arch=('i686' 'x86_64')
url='http://roxterm.sourceforge.net/'
license=('GPL3')
depends=('dbus-glib' 'vte' 'hicolor-icon-theme' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
install=roxterm.install
source=("http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.bz2")
sha256sums=('168e8cf8747820cdee1815c9b47ee188e2f7d6187f7f06d215f4728de5c7faf7')

build() {
  cd "${srcdir}/roxterm-${pkgver}"

  python2 mscript.py configure --prefix='/usr' --disable-gtk3
  python2 mscript.py build
}

package() {
  cd "${srcdir}/roxterm-${pkgver}"
  python2 mscript.py install --destdir="${pkgdir}"
}
