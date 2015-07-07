# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=festival-italian
pkgver=1.0
pkgrel=2
pkgdesc="Italian version of FESTIVAL"
arch=('any')
url="http://www.pd.istc.cnr.it/FESTIVAL/home/default.htm"
license=('GPL')
depends=('festival')
source=(http://downloads.sourceforge.net/sourceforge/it-festival/Italian-FESTIVAL.zip)
md5sums=('e54ff149497a1b76a3a6b65f62eaab35')

build() {
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
