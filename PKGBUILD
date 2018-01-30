# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=roxterm
pkgver=3.3.2
pkgrel=3
pkgdesc='Tabbed, VTE-based terminal emulator'
arch=('x86_64')
url='https://sourceforge.net/projects/roxterm/'
license=('GPL3')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile'
             'imagemagick' 'librsvg' 'itstool')
source=("http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.xz"
        "http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.xz.sign")
sha512sums=('6489d8c736d38d624967cf779820414c106a15b423cfc3c8ceed57093e3ff9bd66bf9979eee4361f331766807e17993ce4b4dfd71381aeae5f9d20462ff9ed5e'
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
