# Maintainer: fzerorubigd <fzero@rubi.gd>
pkgname=protobuf-go
pkgver=1.3.3
pkgrel=3
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

sha256sums=('b3a1440808d6ed4dc0d194c482de029f6c116b1de7f7a3bf927324d965ff3853')
