# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.0.6
pkgrel=2
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus base-devel')
depends=('dbus')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3be7143553ab6a3cdccaebba2715b5060d9c517f5df558c5ad82021d78ca6efc')
#validpgpkeys=('CE89029EE8D81EFE1BCBFF8799DC9230CCA46487')

build() {
	cd "$pkgname-$pkgver"
	make VERSION_HASH="$pkgver" build
}


package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" INSTALL_PREFIX="usr" install
}

