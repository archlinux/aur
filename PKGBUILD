# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ocaml-integers
pkgver=0.2.2
pkgrel=1
pkgdesc='Library for binding to C libraries using pure OCaml'
arch=('i686' 'x86_64')
url=https://github.com/ocamllabs/ocaml-integers
license=('custom')
makedepends=('ocaml-topkg')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocamllabs/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('f966342ad19682d4d5ade1e202388a81')

build() {
  cd ${pkgname}-$pkgver
  make 
}

package() {
  cd ${pkgname}-$pkgver

  opam-installer --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}$(ocamlc -where)" \
    --docdir="${pkgdir}/usr/share/doc"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE.md
}
