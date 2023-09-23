# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.9
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://git.sr.ht/~mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus' 'scdoc')
depends=('dbus')
source=("https://git.sr.ht/~mariusor/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c96892f18e63a3eaec63d110cfa8d7c6afa2a9a270357ca8bcb8f61e687085bc')
validpgpkeys=('2AEC637FA54CA7A0EBB1F2F170BC3F8784FBD057')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" release
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}
