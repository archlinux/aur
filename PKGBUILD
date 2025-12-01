# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcos Heredia <chelqo at gmail dot com>
# Contributor: Juan Diego Tascon

pkgname=tzclock
pkgver=4.7
pkgrel=1
pkgdesc="Cairo clock to display the time around the world"
arch=('x86_64')
url="https://theknight.co.uk"
license=("GPL-3.0-only")
depends=('gtk3' 'libnotify' 'libdial')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.bz2::$url/releases/Source/$pkgname-$pkgver.tar.bz2")
sha256sums=('ff9fe076ab306c8ebb68bbe4797726f24a67b8cd5fddb926f745c38b0d136cce')

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
