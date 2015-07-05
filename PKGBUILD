# Maintainer: David Vilar <davvil@gmail.com>
pkgname=vassal
pkgver=3.2.15
pkgrel=1
pkgdesc="Game engine for building and playing online adaptations of board games and card games."
arch=('i686' 'x86_64')
url="http://www.vassalengine.org/"
license=('LGPL')
groups=()
depends=('java-runtime')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/vassalengine/files/VASSAL-current/VASSAL-${pkgver}/VASSAL-${pkgver}-linux.tar.bz2)
noextract=()
md5sums=('5da6e7633b15cab5ca1d330522c21ee5')

build() {
  true
}

package() {
  cd "$srcdir/VASSAL-$pkgver"
  destdir=$pkgdir/usr/share/java/$pkgname

  mkdir -p $destdir
  cp -r doc lib $destdir

  mkdir -p $pkgdir/usr/bin
  cat << EOF > $pkgdir/usr/bin/vassal
#!/bin/bash
cd /usr/share/java/$pkgname && java -classpath lib/Vengine.jar VASSAL.launch.ModuleManager "\$@"
EOF
  chmod a+x $pkgdir/usr/bin/vassal
}

# vim:set ts=2 sw=2 et:
