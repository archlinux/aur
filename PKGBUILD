# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=go-goopt
pkgver=1
pkgrel=1
pkgdesc='A getopt-like processor of command-line flags.'
arch=(i686 x86_64)
url='https://github.com/droundy/goopt'
license=('GPL')
depends=(bash)
makedepends=(git go)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
_gourl='github.com/droundy/goopt'

build(){
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}
check() {
  cd "$srcdir"
  GOPATH="$srcdir" go test -v -x ${_gourl}/...
}
package(){
  cd "$srcdir"
  source /etc/profile.d/go.sh
  mkdir -p "$pkgdir"/$GOPATH
  cp -R --preserve=timestamps ${srcdir}/{src,pkg} "${pkgdir}/$GOPATH"
}
