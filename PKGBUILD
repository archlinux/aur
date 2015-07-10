# Maintainer: anekos <anekos atmark snca period net>
pkgname=ezoe-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Not a question"
arch=('i686' 'x86_64')
url="https://github.com/mattn/ezoe"
license=('MIT')
makedepends=('git' 'go')
provides=('ezoe')
_gourl="github.com/mattn/ezoe"

build() {
	GOPATH=$srcdir go get -v -d -x $_gourl
	cd $srcdir/src/$_gourl
	GOPATH=$srcdir go build -o $srcdir/ezoe
}

package() {
	cd "$srcdir"
	install -Dm755 ezoe "$pkgdir/usr/bin/ezoe"
}
