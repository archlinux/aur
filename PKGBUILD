# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=isx2gb
pkgver=1.03
_commit=89c5fa18f87d68ff1ca2576776dab767454a95ac
pkgrel=2
pkgdesc="Nifty replacement for abISX or CVTISX that converts Intelligent Systems eXecutable files into valid GameBoy ROM images and more"
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('go' 'git')
url="https://gitlab.com/gitendo/isx2gb"
source=("git+https://gitlab.com/gitendo/isx2gb.git#commit=$_commit")
sha1sums=('SKIP')

build() {
	cd "$srcdir"/isx2gb
	go build isx2gb.go
}

package() {
	cd "$srcdir"/isx2gb
	install -Dm755 isx2gb "$pkgdir"/usr/bin/isx2gb
}
