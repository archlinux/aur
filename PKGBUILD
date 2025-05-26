# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Florian Knodt <adlerweb@adlerweb.info>

pkgname=xbrightness
pkgver=0.3
pkgrel=4
pkgdesc="Software X11 brightness control"
arch=(x86_64 i686)
url="https://shallowsky.com/software/xbrightness/"
license=('custom')
groups=('x11')
depends=(libxaw libxpm libxxf86vm libxmu)
source=(http://shallowsky.com/software/xbrightness/xbrightness-${pkgver}-mika-akk.tar.gz)
md5sums=('3b7a35a67407ffc07aed9dd8b42caa68')

build() {
  cd "xbrightness-${pkgver}-mika-akk"
  sed -i "s/ -m32//g" Makefile
  make all
}
package() {
  cd "xbrightness-${pkgver}-mika-akk"
  make DESTDIR="${pkgdir}" install
}
