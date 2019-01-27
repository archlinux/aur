# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=alt-ergo
pkgver=2.2.0
pkgrel=1
pkgdesc='SMT solver for software verification'
arch=('i686' 'x86_64')
license=('custom:CeCILL-C')
url='https://alt-ergo.ocamlpro.com'
depends=('gtksourceview2' 'ocaml-zarith' 'ocaml-zip' 'ocaml-ocplib-simplex-git' 'ocaml-psmt2-frontend-git')
makedepends=('lablgtk2')
source=("https://github.com/OCamlPro/alt-ergo/archive/${pkgver}.tar.gz")
sha256sums=('61b09612be666d1f5ac0abcc41d94bae81e036cc07cd74898dd37f7fbf48da06')

build() {
    cd "$srcdir/$pkgname-$pkgver/sources"
    autoconf
    ./configure --prefix=/usr
    make
    make gui
}

package() {
    cd "$srcdir/$pkgname-$pkgver/sources"
    make DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-gui
}

# vim:set et sw=4 sts=4 et:
