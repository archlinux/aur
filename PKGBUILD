# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.5.3
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dc7b91a6da1c3f0b7f9a0368ca2040a013c63e0470277bc5b1658e3b10ed704f')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" release
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

