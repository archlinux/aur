# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-cairo-git
pkgver=20150609
pkgrel=2
pkgdesc="OCaml bindings for cairo"
arch=('i686' 'x86_64')
url="http://cairographics.org/cairo-ocaml/"
license=('LGPL2')
depends=('ocaml' 'cairo' 'lablgtk2' 'libsvg-cairo')
makedepends=('git')
provides=('ocaml-cairo')
source=("git://anongit.freedesktop.org/cairo-ocaml.git")
md5sums=('dbd5aeb38b883d7e0d95f2c9fe108eb9')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install || return 1
  install -m 644 "$srcdir/META" "$pkgdir/usr/lib/ocaml/cairo/"
}
