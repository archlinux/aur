# Maintainer: Armin Preiml <apreiml@strohwolke.at>

pkgname=prunef
pkgver=0.1.0
pkgrel=1
pkgdesc='A backup rotation filter'
arch=('x86_64')
url='https://git.sr.ht/~apreiml/prunef'
license=('MIT')
makedepends=('go' 'scdoc')
provides=('prunef')
conflicts=('prunef')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~apreiml/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c9ff838bd37a37aac14f1a4f5282fd8748fa1dfe22c69560cb25e2a08f008e0a')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
