# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.8.4
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus' 'scdoc')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bbdfc0e5b1e863d30afaa5a592b2f5eb7baf27f6c3a22373451756234518b2a9')
validpgpkeys=('A9A02AFEFF4B4D3CCC80F6168218F7122969D484')

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
