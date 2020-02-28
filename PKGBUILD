# Maintainer: fzerorubigd <fzero@rubi.gd>
pkgname=protobuf-go
pkgver=1.3.4
pkgrel=1
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
	GOPATH=${srcdir} GOBIN=${srcdir}/bin go get -v ./...
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/protoc-gen-go $pkgdir/usr/bin/protoc-gen-go
}

sha256sums=('5e4279eb197ff7271cb06ae97a16f721d0fd6962ff2d2560831309c0900e72c4')
