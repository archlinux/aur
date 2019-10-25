# Maintainer: fzerorubigd <fzero@rubi.gd>
pkgname=protobuf-go
pkgver=1.3.2
pkgrel=2
pkgdesc="Go support for Google's protocol buffers"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/golang/protobuf"
license=('BSD')
depends=('protobuf')
makedepends=('go' 'git')
source=("https://github.com/golang/protobuf/archive/v${pkgver}.tar.gz")

_gitname=protobuf

build() {
	mkdir -p ${srcdir}/src/github.com/golang/
	cp -r ${srcdir}/protobuf-${pkgver} ${srcdir}/src/github.com/golang/protobuf
	cd ${srcdir}/src/github.com/golang/protobuf
	 GOPATH=${srcdir} go get -v ./...
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/protoc-gen-go $pkgdir/usr/bin/protoc-gen-go
}

sha256sums=('c9cda622857a17cf0877c5ba76688a931883e505f40744c9495638b6e3da1f65')
