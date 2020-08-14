#Maintainer: ondra05
pkgname=go-latest-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Core compiler tools for the Go programming language"
arch=('x86_64')
url="https://golang.org"
license=(BSD)
makedepends=('tar')
source=(https://dl.google.com/go/go1.15.linux-amd64.tar.gz)
sha256sums=('2d75848ac606061efe52a8068d0e647b35ce487a15bb52272c427df485193602')
provides=('go')
replaces=('go')
conflicts=('go')
options=(!strip !docs libtool emptydirs)
package() {
	install -d "${pkgdir}/opt/go"
	install -d "${pkgdir}/usr/bin"
	cp -r "${srcdir}/go/"* "${pkgdir}/opt/go" -R
	ln -s /opt/go/bin/go "${pkgdir}"/usr/bin/go
	ln -s /opt/go/bin/gofmt "${pkgdir}"/usr/bin/gofmt
}

