# Maintainer: syll <syll-dev@laposte.net>
# Contributor: syll <syll-dev@laposte.net>
pkgname=histoiremondiale
pkgver=2.1
pkgrel=1
_reparchive=histoiremondiale-2.1-src
pkgdesc="Atlas historique - survoler le monde et lire la description de la période"
arch=(any)
url="http://histoiremondiale.net"
license=('AGPL3', 'CC', 'LAL')
depends=('java-runtime>=8')
makedepends=('java-environment>=8')
source=(http://sourceforge.net/projects/histmondiale/files/stable-2.1/histoiremondiale-2.1-src.tar.gz) # Attention à ne pas mettre de "/" à la fin !
md5sums=('2e4ac00f8871c8fd8cc44fe4c90a6f16')


build()
{
  cd "$srcdir/$_reparchive"
  ./configure
  make
}


package ()
{
  cd "$srcdir/$_reparchive"
  make DESTDIR="$pkgdir" install
}
