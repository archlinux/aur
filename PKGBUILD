# Maintainer: Armin Preiml <apreiml@strohwolke.at>

pkgname=prunef
pkgver=1.0.0
pkgrel=1
pkgdesc='A backup rotation filter'
arch=('x86_64')
url='https://git.sr.ht/~apreiml/prunef'
license=('MIT')
makedepends=('go' 'scdoc')
provides=('prunef')
conflicts=('prunef')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~apreiml/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6260021d226b9f8b31617e60b203d7bd99fa33fcc2ebc18688d79faa0199ce8c')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
