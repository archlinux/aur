# Maintainer: rich_o <aurua@riseup.net>

pkgname=paperkey
pkgver=1.4
pkgrel=1
pkgdesc="Make long term backups of OpenPGP keys by printing only the secret bits on paper."
arch=('i686' 'x86_64')
url="http://www.jabberwocky.com/software/paperkey/"
license=('GPL2')
depends=('glibc')
source=(http://www.jabberwocky.com/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('e12bb0ec835127d12a922a8d60b3dfdb3ca8ee60bb5b4d15ae4cea85bbcf336f')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
