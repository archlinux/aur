# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.3.4
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('623c413ee059e6cad195bc3c8b37c135a3bd6ffa03c6d23fb897d3138ba9f2e6')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" build
}


package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

