# Maintainer: fzerorubigd <fzero@rubi.gd>
pkgname=protobuf-go
pkgver=1.3.2
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/golang/protobuf"
license=('BSD')
depends=('protobuf')
makedepends=('go' 'git')
source=('git://github.com/golang/protobuf.git')

sha1sums=('SKIP')

_gitname=protobuf

build() {
	mkdir -p ${srcdir}/src/github.com/golang/protobuf
        cd "${srcdir}/${_gitname}"
	git --work-tree=${srcdir}/src/github.com/golang/protobuf checkout -f v${pkgver}
	cd ${srcdir}/src/github.com/golang/protobuf
	 GOPATH=${srcdir} go get -v ./...
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/protoc-gen-go $pkgdir/usr/bin/protoc-gen-go
}
