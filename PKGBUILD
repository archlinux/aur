# Maintainer: Baptiste Grenier <baptiste@bapt.name>

pkgname=asanawarrior
pkgver=1.0
pkgrel=1
pkgdesc="The only Asana command line interface you'll ever need. https://wiki.dgraph.io/Asanawarrior"
arch=('x86_64' 'i686')
url="https://github.com/manishrjain/asanawarrior"
license=('apache')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/manishrjain/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('db409b9d4b2be31e229dabba840664c0323f02af1fd804c659541b27e0e33d97')
_gourl=github.com/manishrjain/asanawarrior

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
