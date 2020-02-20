# Maintainer: Fabius
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=festival-italian
pkgver=1.0
pkgrel=3
pkgdesc="Italian Version of FESTIVAL Text to Speech synthesis system"
arch=('any')
url="http://www.pd.istc.cnr.it/FESTIVAL/home/default.htm"
license=('GPL')
makedepends=('unzip')
depends=('festival')
source=(http://downloads.sourceforge.net/sourceforge/it-festival/Italian-FESTIVAL.zip)
sha256sums=('747ef3a31571896d7d772ea46d4ee68cf0fbc57af21e8c5220fced731695f496')

package() {
  cd $srcdir

  for i in $(ls *.zip | grep -v win)
  do
    unzip -o $i
  done

  # Unset the world and group writable bit for every file
  chmod -R go-w *

  mkdir -p $pkgdir/usr/share/festival
  mv festival/lib/* $pkgdir/usr/share/festival
}
