# Maintainer: PinkCathodeCat <awils_1 atsymbol xsmail dot com>
# Contributor: Tbsc <me in tbscdev point xyz>

pkgname=ratslap
pkgver=0.2.3
pkgrel=1
pkgdesc="Community made Linux drivers for Logitech mice (Currently only G300s)"
arch=('i686' 'x86_64')
url="https://gitlab.com/krayon/$pkgname"
license=('GPL2')
depends=('libusb')
makedepends=('git')
provides=('ratslap')
conflicts=('ratslap')
options=()
install=
source=("$pkgname::git+https://gitlab.com/krayon/$pkgname#tag=$pkgver,branch=master")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
        make
}

check() {
	true
}

package() {
        cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/$pkgname" "${pkgdir}/usr/bin/ratslap"
}
