# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
# Contributor: Brandon Invergo <brandon@invergo.net>
pkgname=paperq
pkgver=1.2.4
pkgrel=1
pkgdesc="A tool for managing a reading queue for academic literature"
arch=('i686' 'x86_64')
url="http://paperq.invergo.net/"
license=('GPL3')
depends=('libunistring' 'btparse')
optdepends=('zeptodb: caching of bibliographic information')
source=("http://paperq.invergo.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('98cffc24514d65050f3c4e4e9579bcaa')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
