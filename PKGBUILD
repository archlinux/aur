# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc
pkgver=0.3.0
pkgrel=3
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('w3m' 'dante' 'notmuch')
makedepends=('go' 'git' 'scdoc')
provides=('aerc')
conflicts=('aerc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('44d5ab0d5f1195166b351ec59680cc8f4c0eb45da4d44263b138be0a91a512a1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make GOFLAGS=-tags=notmuch PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
