# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.2.2
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('171b448e69eb625ac233fe4736ff5e8a677271463e1ed7d2a79f318be1b6819b')
#validpgpkeys=('CE89029EE8D81EFE1BCBFF8799DC9230CCA46487')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" build
}


package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

