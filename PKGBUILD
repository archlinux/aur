# Maintainer: Roel Kluin <r.o.e.lkluin@gmail.com>

pkgname='menhir'
pkgver=20151112
pkgrel=1
pkgdesc="A LR(1) parser generator for the OCaml programming language"
arch=('i686' 'x86_64')
url="http://cristal.inria.fr/~fpottier/menhir/"
license=('custom: QPL-1.0')
groups=()
depends=('ocaml')
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
source=("http://cristal.inria.fr/~fpottier/menhir/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('51cfe8573ed11949dc0fa2c46dae47e2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make PREFIX="${pkgdir}/usr" install

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
