# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: <oliver (at) first . in - berlin . de>
# Contributor: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>

pkgname=ocaml-curses
pkgver=1.0.11
pkgrel=1
license=('LGPL')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml libs for curses"
url="https://github.com/mbacarella/curses"
depends=()
options=('!strip')
makedepends=('ocaml' 'dune')
source=("https://github.com/mbacarella/curses/releases/download/${pkgver}/curses-${pkgver}.tbz")
sha256sums=('603c08e816b22e200f7818544ffd016620a808945cfa757dd1aeb245e0b51c0e')

build() {
    cd "${srcdir}/curses-${pkgver}"
    dune build
}

package() {
    cd "${srcdir}/curses-${pkgver}"
    DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "/usr/lib/ocaml"
    install -dm755 "${pkgdir}/usr/share/"
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
