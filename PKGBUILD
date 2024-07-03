# Maintainer: Peter <peter@nexoid.at>
pkgname=larceny-bin
_pkgname=larceny
pkgver=1.3
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
install=larceny.install
changelog=
source=("http://www.larcenists.org/LarcenyReleases/${_pkgname}-${pkgver}-bin-native-ia32-linux86.tar.gz")
noextract=()
validpgpkeys=()

# stupid mod_security setup
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
package() {
  cd "${_pkgname}-${pkgver}-bin-native-ia32-linux86"
  sed -i 's|# LARCENY_ROOT.*|LARCENY_ROOT=/usr/share/larceny|' larceny
  install -p -D larceny ${pkgdir}/usr/bin/larceny
  install -p -D larceny.bin ${pkgdir}/usr/share/larceny/larceny.bin
  install -p -D larceny.heap ${pkgdir}/usr/share/larceny/larceny.heap
  install -p -D startup.sch ${pkgdir}/usr/share/larceny/startup.sch
  install -p -D compile-stale ${pkgdir}/usr/share/larceny/compile-stale
  install -p -D COPYRIGHT ${pkgdir}/usr/share/larceny/COPYRIGHT
  install -p -D README-FIRST.txt ${pkgdir}/usr/share/larceny/README-FIRST.txt
  install -p -D scheme-script ${pkgdir}/usr/share/larceny/scheme-script
  cp --preserve=timestamps -R lib ${pkgdir}/usr/share/larceny/
  cp --preserve=timestamps -R doc ${pkgdir}/usr/share/larceny/
}

sha256sums=('f04a63e69d6aa2dfd633a5583628d41ca545e7327ce801ba3c61bf16b7184821')
