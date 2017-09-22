# Maintainer: Tomas Jasek <tomsik68(at)gmail(dot)com>

pkgname="papyrus"
pkgver="3.0.0"
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
_eclipsever="oxygen"
source_i686=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/modeling/mdt/papyrus/rcp/${_eclipsever}/${pkgver}/papyrus-${_eclipsever}-${pkgver}-linux32.tar.gz")
md5sums_i686=('608176cd672d425ce4d21f9cf2cf0149')
md5sums_x86_64=('dcf605876567afcfd5d1a3a7ce617e5b')
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
