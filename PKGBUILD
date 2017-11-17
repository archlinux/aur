# Maintainer: nerflad <nerflad@gmail.com>

pkgname=ocaml-easy-format
_oname=easy-format
pkgver=1.2.0
pkgrel=1
pkgdesc="Data pretty printing made easy"
url=('https://github.com/mjambon/easy-format')
arch=('i686' 'x86_64' 'armv7h')
options=('!strip' 'staticlibs')
license=('BSD')
makedepends=('ocaml-findlib')
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
sha256sums=('a288fabcdc19c2262e76cf93e0fd987fe1b21493edd13309522fbae405329ffd')
build() {
  cd $srcdir/$_oname-$pkgver
  make
}

package() {
  cd $srcdir/$_oname-$pkgver
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) install
}
