# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=roxterm
pkgver=3.3.2
pkgrel=2
pkgdesc='Tabbed, VTE-based terminal emulator'
arch=('x86_64')
url='http://roxterm.sourceforge.net/'
license=('GPL3')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile'
             'imagemagick' 'librsvg' 'itstool')
source=("http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.xz"
        "http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.xz.sign")
md5sums=('efbe5b99151ae7f6ea506f2f219374a6'
         'SKIP')
sha1sums=('a0cfc57576b5117846181d71d33207e1a3a0a618'
          'SKIP')
validpgpkeys=('2FF283656D0745E54850B1C0BF0EBCD13D97CD09') # Tony Houghton

build() {
  cd "${srcdir}/roxterm-${pkgver}"

  python2 mscript.py configure --prefix='/usr'
  python2 mscript.py build
}

package() {
  cd "${srcdir}/roxterm-${pkgver}"
  python2 mscript.py install --destdir="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
