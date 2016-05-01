# Maintainer: Tomas Jasek <tomsik68(at)gmail(dot)com>

pkgname="papyrus"
pkgver="1.1.4"
pkgrel=2
pkgdesc="Graphical editing tool for UML based on eclipse."
arch=('i686' 'x86_64')
url="http://www.eclipse.org/papyrus/"
license=('EPL')
groups=()
depends=('java-runtime')
makedepends=(tar)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686=("http://ftp.snt.utwente.nl/pub/software/eclipse//modeling/mdt/papyrus/rcp/mars/${pkgver}/papyrus-mars-${pkgver}-linux32.tar.gz")
md5sums_i686=('01f352ceed549a1373a0ea905b9962e3')
md5sums_x86_64=('7f3a26468f09e205c8ea9f8a126f6991')
source_x86_64=("http://ftp.snt.utwente.nl/pub/software/eclipse//modeling/mdt/papyrus/rcp/mars/${pkgver}/papyrus-mars-${pkgver}-linux64.tar.gz")
noextract=()

build() {
  cd $srcdir
  tar -xvzf *.gz
  mkdir -p $srcdir/usr/bin/
  echo 'exec /usr/lib/papyrus/papyrus' > $srcdir/usr/bin/papyrus
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/papyrus
  mv $srcdir/Papyrus/* $pkgdir/usr/lib/papyrus/
  mkdir -p $pkgdir/usr/bin/
  install -m775 $srcdir/usr/bin/papyrus $pkgdir/usr/bin/papyrus
}
