# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
                                                                                                                                                                
pkgname="barnard-git"
pkgver=20181106
pkgrel=1
pkgdesc="A command line mumble client."
arch=('armv7h' 'x86_64')
url="https://github.com/layeh/barnard"
license=('GPL2')
depends=('openal' 'opus')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
_gourl=layeh.com/barnard
                                                                                                                                                                
build() {
  GOPATH="$srcdir" go get -fix -v -x -u ${_gourl}
}
                                                                                                                                                                
check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}
                                                                                                                                                                
package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
                                                                                                                                                                
  #mkdir -p "$pkgdir/$GOPATH"
  #cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"
                                                                                                                                                                
}
                                                                                                                                                                
# vim:set ts=2 sw=2 et:
