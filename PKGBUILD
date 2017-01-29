# Maintainer: Tomas Jasek <tomsik68(at)gmail(dot)com>

pkgname="papyrus"
pkgver="2.0.2"
pkgrel=1
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
_eclipsever="neon"
source_i686=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/modeling/mdt/papyrus/rcp/${_eclipsever}/${pkgver}/papyrus-${_eclipsever}-${pkgver}-linux32.tar.gz")
md5sums_i686=('55ab4ea4cc6da06fbdea4e2659f49498')
md5sums_x86_64=('6304576c21d5560f9dd1d112e7c4364b')
source_x86_64=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/modeling/mdt/papyrus/rcp/${_eclipsever}/${pkgver}/papyrus-${_eclipsever}-${pkgver}-linux64.tar.gz")
noextract=()

build() {
  cd $srcdir
  tar -xvzf papyrus-${_eclipsever}-${pkgver}-linux*.tar.gz
  mkdir -p $srcdir/usr/bin/
  echo -e '#!/bin/sh\nexec /usr/lib/papyrus/papyrus' > $srcdir/usr/bin/papyrus
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/papyrus
  mv $srcdir/Papyrus/* $pkgdir/usr/lib/papyrus/
  mkdir -p $pkgdir/usr/bin/
  install -m775 $srcdir/usr/bin/papyrus $pkgdir/usr/bin/papyrus
}
