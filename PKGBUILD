# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>

pkgname=roy
pkgver=1.7.4
pkgrel=1
pkgdesc="With the roy tool you can build custom signature files for siegfried, the signature-based file format identification tool.
"
arch=('x86_64' 'i686')
url="http://www.itforarchivists.com/siegfried"
license=('APACHE')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/richardlehane/siegfried/cmd/roy

build() {
  GOPATH="$srcdir" go get ${_gourl}
}

check() {
  GOPATH="$GOPATH${GOPATH+:}$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir"/bin/roy "$pkgdir"/usr/bin/roy
}

# vim:set ts=2 sw=2 et:
