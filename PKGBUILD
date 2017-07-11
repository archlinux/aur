# Maintainer: John Trengrove <john@retrofilter.com>

pkgname=dgraph-git
pkgver=20170711
pkgrel=1
pkgdesc='a low latency, high throughput, native and distributed graph database'
arch=('x86_64' 'i686')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE')
conflicts=('dgraph dgraph-bin')
provides=('dgraph')
options=('!strip' '!emptydirs')
depends=('go')

build() {
  GOPATH="$srcdir" go get -v github.com/dgraph-io/dgraph/cmd/...
}

package() {
  cd "$srcdir"
  for binary in dgraph dgraphloader postingiterator; do
    install -Dm755 bin/$binary "$pkgdir/usr/bin/$binary"
  done
}

# vim:set ts=2 sw=2 et:
