# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.3.2
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d2466d0aa5cfcf5c9274447863d0c2702f1bea3e0529ad3f1dca5ece8c954a08')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" build
}


package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

