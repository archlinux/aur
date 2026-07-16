# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=racer
pkgver=1.1.64
pkgrel=4
pkgdesc='2D car racing game'
arch=('i686' 'x86_64')
url="http://hippo.nipax.cz/download.cz.php?id=64"
license=('GPL-2.0-only')
depends=('allegro4' 'libjpeg-turbo')
source=("http://hippo.nipax.cz/src/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.install")
sha256sums=('cefe897592038e7abbea6b7990945cc435eaf83723f446e773a20ac56ad60969'
	    'b4c42bc1c80201529ab639daefabb4853ee583bd7072293a88f39b8ed26ee0a2')
install="${pkgname}.install"

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}"/usr install

  # finally, copy the license and readme files from srcdir to /usr/share/racer:
  cp ./COPYING $pkgdir/usr/share/${pkgname}
  cp ./README $pkgdir/usr/share/${pkgname}
}
