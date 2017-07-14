# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>

pkgname=siegfried
pkgver=1.7.4
pkgrel=1
pkgdesc="Siegfried is a signature-based file format identification tool, implementing the National Archives UK's PRONOM
file format signatures and freedesktop.org's MIME-info file format signatures.
"
arch=('x86_64' 'i686')
url="http://www.itforarchivists.com/siegfried"
license=('APACHE')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/richardlehane/siegfried/cmd/sf

build() {
  GOPATH="$srcdir" go get ${_gourl}
}

check() {
  GOPATH="$GOPATH${GOPATH+:}$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir"/bin/sf "$pkgdir"/usr/bin/sf
}

# vim:set ts=2 sw=2 et:
