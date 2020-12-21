
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=cstatus
pkgver=0.1.0
pkgrel=1
pkgdesc='statusbar for dwm written in C99.'
arch=('x86_64')
url='https://git.sr.ht/~andreafeletto/cstatus'
license=('MIT')
depends=('xorg-xsetroot' 'pulsemixer')
provides=('cstatus')
conflicts=('cstatus-git')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~andreafeletto/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c3265d708e4d6c97368f8f20305f00c0273ff943060dc93d0f0f8b42f742602b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
