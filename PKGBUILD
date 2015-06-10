pkgname=go-check
pkgver=1
pkgrel=2
pkgdesc="Rich testing framework"
arch=('x86_64' 'i686')
url="http://launchpad.net/gocheck"
license=('BSD')
makedepends=('go' 'bzr')
options=('!strip' '!emptydirs')
_gourl=launchpad.net/gocheck

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}/...
}

package() {
  source /etc/profile.d/go.sh
  mkdir -p "${pkgdir}/$GOPATH"
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "${pkgdir}/$GOPATH"
}

# vim:set ts=2 sw=2 et:
