# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: <oliver (at) first . in - berlin . de>
# Contributor: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>

pkgname=ocaml-curses
pkgver=1.0.10
pkgrel=1
license=('LGPL')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml libs for curses"
url="https://github.com/mbacarella/curses"
depends=()
options=('!strip')
makedepends=('ocaml' 'dune')
source=("https://github.com/mbacarella/curses/releases/download/1.0.10/curses-${pkgver}.tbz")
sha256sums=('c9126f9798f0c5b3beb05efe89c7713cf655c1ffbe040a52f218aeba291922af')

build() {
    cd "${srcdir}/curses-${pkgver}"
    dune build
}

package() {
    cd "${srcdir}/curses-${pkgver}"
    DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"
    install -dm755 "${pkgdir}/usr/share/"
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
