# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.5.0
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c797428333ae7dbc1af5a3cf4c1eb3d12467339819e32e4eef91a61cc0fe056d')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" release
}


package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

