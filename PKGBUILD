# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: <deleted-account>

pkgname=wayclip
pkgver=0.5
pkgrel=1
pkgdesc="Wayland clipboard utility"
arch=('x86_64')
url="https://git.sr.ht/~noocsharp/wayclip"
license=('ISC')
depends=('wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~noocsharp/wayclip/archive/$pkgver.tar.gz")
b2sums=('a6cf31c3aaf8e7055088fef771d94248d54549ddfafe60a4dfefb5d88879a61c1571ef448719359b35b77b49e583db98545baf407b94cf1fb8b02229fd2b7366')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
