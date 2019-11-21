# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc
pkgver=0.3.0
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('w3m' 'dante')
makedepends=('go' 'git' 'scdoc')
provides=('aerc')
conflicts=('aerc')
source=("$pkgname::git+https://git.sr.ht/~sircmpwn/aerc#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
