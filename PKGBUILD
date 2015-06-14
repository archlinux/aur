# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>

pkgname=pcb2gcode
pkgver=1.1.4
_pkgver=1.1.4-git2012-07-02
pkgrel=1
pkgdesc="Gerber to gcode file converter" 
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/mediawiki/pcb2gcode/index.php?title=Main_Page"
license=('GPL')
depends=('gerbv=2.6.0')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
md5sums=('52c49627b04013fef16fedba2917efed')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  # no binary due to broken libtool distributed with package
  echo -e 'exec /usr/bin/libtool "$@"' > libtool

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
