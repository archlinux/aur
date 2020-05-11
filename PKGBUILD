# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=isx2gb
pkgver=1.02
_commit=634a309eeb2dcabad083c3271d7bc875a0c36589
pkgrel=1
pkgdesc="Nifty replacement for abISX or CVTISX that converts Intelligent Systems eXecutable files into valid GameBoy ROM images and more"
arch=('x86_64')
license=('custom')
makedepends=('go' 'git')
url="https://github.com/gitendo/isx2gb"
source=("git+https://github.com/gitendo/isx2gb.git#commit=$_commit")
sha1sums=('SKIP')

build() {
	cd "$srcdir"/isx2gb
	go build isx2gb.go
}

package() {
	cd "$srcdir"/isx2gb
	install -Dm755 isx2gb "$pkgdir"/usr/bin/isx2gb
}
