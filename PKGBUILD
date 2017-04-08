# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.3.6
pkgrel=2
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2b8a7fd03705e3a819f08adc2d0b73bd489b9d3c3536ecf9883882351fb1145c')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" release
}


package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

