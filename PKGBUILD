# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=cspice
pkgver="N0065"
pkgrel=1
pkgdesc="A comprehensive toolkit and api to design, simulate and analyse space missions"
arch=("x86_64")
url="https://naif.jpl.nasa.gov/naif/aboutspice.html"
depends=("glibc")
makedepends=("tcsh")
source=("http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z")
sha1sums=('335a16141e3d4f5d2e596838285fc9f918c2f328')


build() {
  cd "cspice"
  ./makeall.csh
}

package() {
  cd "cspice"
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share/doc"

  cp -R data "$pkgdir/usr/share/cspice"
  cp -R doc "$pkgdir/usr/share/doc/cspice"
  cp -R exe "$pkgdir/usr/bin"
  cp -R include "$pkgdir/usr/"
  cp -R lib "$pkgdir/usr/"
}
