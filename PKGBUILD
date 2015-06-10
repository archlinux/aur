# Maintainer: rich_o <aurua@riseup.net>

pkgname=paperkey
pkgver=1.3
pkgrel=1
pkgdesc="Make long term backups of OpenPGP keys by printing only the secret bits on paper."
arch=('i686' 'x86_64')
url="http://www.jabberwocky.com/software/paperkey/"
license=('GPL2')
depends=('glibc')
source=(http://www.jabberwocky.com/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5b57d7522336fb65c4c398eec27bf44ec0aaa35926157b79a76423231792cbfb')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
