# Maintainer: Mineko <minekorox@gmail.com>

pkgname=go-bindata-git
pkgver=0.r209.gb6721d7
pkgrel=1
pkgdesc="Converts any file into managable Go source code - git checkout"
arch=(x86_64)
url="http://github.com/jteeuwen/go-bindata/"
license=(CC0-1.0)

makedepends=(git go)
provides=(go-bindata-git)
conflicts=(go-bindata)
sha256sums=(SKIP)

build()
{
	mkdir gopath
	export GOPATH=$PWD/gopath

	go get github.com/jteeuwen/go-bindata/...
}

package()
{
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	
	cp $srcdir/gopath/pkg/linux_amd64/github.com/jteeuwen/go-bindata.a $pkgdir/usr/lib
	cp $srcdir/gopath/bin/go-bindata $pkgdir/usr/bin
}
