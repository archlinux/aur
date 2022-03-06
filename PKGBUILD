# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcos Heredia <chelqo at gmail dot com>
# Contributor: Juan Diego Tascon

pkgname=tzclock
pkgver=4.3
pkgrel=1
pkgdesc="Cairo clock to display the time around the world"
arch=('x86_64')
url="https://theknight.co.uk"
license=("GPL")
depends=('gtk3' 'libnotify' 'libdial')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.bz2::https://theknight.co.uk/releases/Source/$pkgname-$pkgver.tar.bz2")
sha256sums=('43a2b821f8f45b75aa1f02433117d5e97e7d7d56d4413974f4b9a8aeb21d667a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" make install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 AUTHORS tzclock.spec -t "$pkgdir/usr/share/doc/$pkgname/"
}
