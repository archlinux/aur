# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <Nicolas.Pouillard@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=ocamlnet
pkgver=4.1.9
pkgrel=3
pkgdesc="A library for Web and Internet programming in OCaml"
arch=('i686' 'x86_64')
url="http://projects.camlcity.org/projects/ocamlnet.html"
license=('GPL' 'LGPL')
depends=('ncurses' 'gnutls' 'krb5')
makedepends=('ocaml-findlib' 'ocaml4' 'ocaml-pcre')
#makedepends=('ocaml-findlib' 'ocaml' 'ocaml-pcre' 'ocaml-ssl' 'ocaml-cryptokit')
options=('!strip' '!makeflags' 'staticlibs')
source=(https://gitlab.com/gerdstolpmann/lib-ocamlnet3/-/archive/ocamlnet-$pkgver/lib-ocamlnet3-ocamlnet-$pkgver.tar.gz)
sha256sums=('e5314bab91a650b2e48e5182f1f3d9048bc6c0fd8a9f782ffc86557ec4380cdd')

build(){
  cd $srcdir/lib-ocamlnet3-$pkgname-$pkgver
  ./build.sh -enable-gnutls -enable-gssapi -enable-pcre -bindir /usr/bin
}

package(){
  cd $srcdir/lib-ocamlnet3-$pkgname-$pkgver
  ./install.sh
}
