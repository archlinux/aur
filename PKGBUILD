# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter <craven@gmx.net>
pkgname=larceny
pkgver=0.98
pkgrel=1
pkgdesc="Larceny is a simple and efficient implementation of the Scheme programming language."
arch=(i686 x86_64)
url="http://www.larcenists.org/index.html"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.larcenists.org/LarcenyReleases/${pkgname}-${pkgver}-bin-native-ia32-linux86.tar.gz")
md5sums=('3838232de0a603ddcacebae90a16e1c9')
noextract=()
validpgpkeys=()

package() {
  cd "${pkgname}-${pkgver}-bin-native-ia32-linux86"
  sed -i 's|# LARCENY_ROOT.*|LARCENY_ROOT=/usr/share/larceny|' larceny
  install -D larceny ${pkgdir}/usr/bin/larceny
  install -D larceny.bin ${pkgdir}/usr/share/larceny/larceny.bin
  install -D larceny.heap ${pkgdir}/usr/share/larceny/larceny.heap
  install -D sasstrap.heap ${pkgdir}/usr/share/larceny/sasstrap.heap
  install -D startup.sch ${pkgdir}/usr/share/larceny/startup.sch
  install -D compile-stale ${pkgdir}/usr/share/larceny/compile-stale
  install -D COPYRIGHT ${pkgdir}/usr/share/larceny/COPYRIGHT
  install -D README-FIRST.txt ${pkgdir}/usr/share/larceny/README-FIRST.txt
  install -D scheme-script ${pkgdir}/usr/share/larceny/scheme-script
  cp -R lib ${pkgdir}/usr/share/larceny/
  cp -R doc ${pkgdir}/usr/share/larceny/
}

