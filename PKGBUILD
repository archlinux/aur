# Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=autosubst
pkgver=1.6
pkgrel=1
pkgdesc="Automation for de Bruijn syntax and substition in Coq."
url="https://github.com/tebbi/autosubst"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq<8.5')
makedepends=('camlp5-transitional>=6.12')
source=(https://github.com/tebbi/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('bee082e3bea98d4f9a0672f37d54cfd3b754080f1f341eb041eecd3923e7c13c')
sha512sums=('7632a3c325cf7a166e91491ebec14d74d60f77b039e1e32f437448ad5ce3a7f5e47b7a14fd18f363a64acc33af92b64181b00b5f8f2158fec0defcea2b0d07db')

build() {
  cd $srcdir/${pkgname}-${pkgver}

  make
}

package(){
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir 'COQLIB:=$(DESTDIR)/$(shell coqtop -where)/' install
}
