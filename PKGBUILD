# Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=autosubst
pkgver=1.0
pkgrel=1
pkgdesc="Automation for de Bruijn syntax and substition in Coq."
url="https://www.ps.uni-saarland.de/autosubst/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq<8.5')
makedepends=('camlp5-transitional>=6.12')
source=(https://www.ps.uni-saarland.de/autosubst/releases/${pkgname}_v${pkgver}.tar.gz)
sha256sums=('d659898e0e0bafa740c2368a0510a36c77b22a6b9b0386971e49cfc7b8027a1f')
sha512sums=('4a9f2d3db11a14ccca5ff364814bebf1e4f659f79ee5ded4f6d38d12d8c10b904b9b538b61be7094aae40f3e15d2e018095d8959940b4450256d4637f061fe80')

build() {
  cd $srcdir/

  make
}

package(){
  cd $srcdir/
  make DESTDIR=$pkgdir 'COQLIB:=$(DESTDIR)/$(shell coqtop -where)/' install
}
