# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=ocaml-easy-format
_oname=easy-format
pkgver=1.0.2
pkgrel=1
pkgdesc="Data pretty printing made easy"
url="http://mjambon.com/easy-format.html"
arch=('i686' 'x86_64')
options=('!strip' 'staticlibs')
license=('BSD')
makedepends=('ocaml-findlib')
source=(http://mjambon.com/releases/${_oname}/${_oname}-${pkgver}.tar.gz)
md5sums=('82f6db85477831cab11e4cfe80321225')
build() {
  cd $srcdir/$_oname-$pkgver
  make
}

package() {
  cd $srcdir/$_oname-$pkgver
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) install
}
