# Maintainer: aimileus <me at aimileus dot nl>
# Maintainer: rich_o <aurua@riseup.net>

pkgname=paperkey
pkgver=1.6
pkgrel=1
pkgdesc="Make long term backups of OpenPGP keys by printing only the secret bits on paper."
arch=('x86_64')
url="http://www.jabberwocky.com/software/paperkey/"
license=('GPL2')
depends=('glibc')
source=("http://www.jabberwocky.com/software/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a245fd13271a8d2afa03dde979af3a29eb3d4ebb1fbcad4a9b52cf67a27d05f7')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
