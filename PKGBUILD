# Contributor: Steff <archuserrepository at gmx dot de>
# Contributor: Felix <flx.bier at googlemail dot com>

pkgname=dudenbib
pkgver=5.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Utility to view books from Duden, Brockhaus and some others"
url="http://www.duden.de/deutsche_sprache/index.php?nid=185"
license=('custom:dudenbib')

depends=('libxmu' 'libxft' 'libxcursor' 'libxrandr' 'gcc-libs' 'libxi' 'libxinerama')

if [ "$CARCH" = "x86_64" ]; then
  for i in ${!depends[*]}; do depends[$i]="lib32-"${depends[$i]}; done
fi

FILE="$pkgname-$pkgver-1-debian-ubuntu.deb"
source=("http://www.duden.de/sites/default/files/downloads/servicepacks/bibliothek/$FILE")
noextract=("$FILE")
md5sums=('21a695fc2d905014776fa919acd9b1e6')

package() {
  ar -x $FILE data.tar.gz
  tar -zxf data.tar.gz -C "$pkgdir"
}
