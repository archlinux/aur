# Maintainer: Tomas Jasek <tomsik68(at)gmail(dot)com>

pkgname="aptana-studio"
pkgver="3.6.1"
pkgrel=1
pkgdesc="Aptana Studio 3.6.1 is code base and complete eclipse-based environment that includes extensive capabilities to build Ruby and Rails, PHP, and Python applications, along with complete HTML, CSS and JavaScript editing. "
arch=('i686' 'x86_64')
url="http://www.aptana.com/products/studio3/download.html"
license=('GPL3')
groups=()
depends=('java-runtime')
makedepends=(tar)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686=("https://github.com/aptana/studio3/releases/download/v3.6.1/Aptana_Studio_3_Setup_Linux_x86_${pkgver}.zip")
source_x86_64=("https://github.com/aptana/studio3/releases/download/v3.6.1/Aptana_Studio_3_Setup_Linux_x86_64_${pkgver}.zip")
md5sums_i686=('bf3c1923ea051c29803b6bc2b5d50ff9')
md5sums_x86_64=('5df9fa66cd28648e311c1ca662de1508')
noextract=()

build() {
  cd $srcdir
  bsdtar -xf *.zip
  mkdir -p $srcdir/usr/bin/
  echo 'exec /usr/lib/aptana/AptanaStudio3' > $srcdir/usr/bin/aptana-studio
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/aptana
  mv Aptana_Studio_3 $pkgdir/usr/lib/
  cd $pkgdir/usr/lib/
  mv Aptana_Studio_3/* aptana
  rm -rf Aptana_Studio_3
  mkdir -p $pkgdir/usr/bin/
  install -m775 $srcdir/usr/bin/aptana-studio $pkgdir/usr/bin/aptana-studio
}
