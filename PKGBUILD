# Maintainer: Yiğit Salar <yigit (dot) salar7 (at) gmail (dot) com>
pkgname=mblaze-ui-git
_pkgname=mblaze-ui
pkgver=r60.54f778f
pkgrel=1
pkgdesc="A minimal TUI for the mblaze email client"
arch=('x86_64')
url="https://github.com/nmeum/mblaze-ui"
license=('GPL-3.0-or-later')
depends=(mblaze)
makedepends=(go)
provides=('mblaze-ui')
conflicts=('mblaze-ui')
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd $srcdir/$_pkgname
	mkdir -p go
	GOPATH=$PWD/go go install .
	chmod -R 755 go
}

package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/$_pkgname/go
	cp -R bin/* $pkgdir/usr/bin
}
