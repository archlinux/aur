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
sha256sums=('26211ec89deef5ee33562966c843a35aeee38c053691e427545885f21dd0d660')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
