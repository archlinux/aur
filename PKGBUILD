# Maintainer: Tbsc <me in tbscdev point xyz>

pkgname=ratslap
pkgver=0.2.0
pkgrel=1
pkgdesc="Community made Linux drivers for Logitech mice (Currently only G300s)"
arch=('i686' 'x86_64')
url="https://gitlab.com/krayon/ratslap"
license=('GPL2')
depends=('libusb')
makedepends=('git' 'ctags')
provides=('ratslap')
conflicts=('ratslap')
options=()
install=
source=('ratslap::git+https://gitlab.com/krayon/ratslap#tag=0.2.0,branch=master')
md5sums=('SKIP')

build() {
	cd "$srcdir/ratslap"
	make
}

check() {
	true
}

package() {
	cd "$srcdir/ratslap"
	install -Dm755 "$srcdir/ratslap/ratslap" "${pkgdir}/usr/bin/ratslap"
}
