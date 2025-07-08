# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=torcs-data
pkgver=1.3.8
pkgrel=1
pkgdesc="A 3D racing cars simulator using OpenGL"
url="http://torcs.sourceforge.net"
license=("GPL")
arch=('any')
makedepends=('plib' 'freeglut' 'freealut' 'libxi' 'libxmu' 'libxrandr' 'libpng' 'libvorbis' 'mesa' 'glu')
source=(http://downloads.sourceforge.net/sourceforge/torcs/torcs-${pkgver/_/-}.tar.bz2)
md5sums=('45261f9d1a66fc46f1735d57fad97ed5')

build() {
  cd "$srcdir"/torcs-${pkgver/_/-}
  ./configure --prefix=/usr --x-includes=/usr/include --x-libraries=/usr/lib
}

package() {
  cd "$srcdir"/torcs-${pkgver/_/-}
  make DESTDIR="$pkgdir" datainstall
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
