# Maintainer: Armin Preiml <apreiml@strohwolke.at>

pkgname=prunef
pkgver=0.2.0
pkgrel=1
pkgdesc='A backup rotation filter'
arch=('x86_64')
url='https://git.sr.ht/~apreiml/prunef'
license=('MIT')
makedepends=('go' 'scdoc')
provides=('prunef')
conflicts=('prunef')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~apreiml/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('27c11e895082821e85bf353d46e9afb9bf1126ea1b78291e9fc263275f3a791e')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
