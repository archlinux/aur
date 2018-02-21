# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.7.0
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('906f9a6dc043a523892a2fc5e8e5beb8554f9182fd19da13ca024c993c80f735')
validpgpkeys=('A9A02AFEFF4B4D3CCC80F6168218F7122969D484')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver-$pkgrel" release
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

