# Maintainer: Andrea Feletto <andrea@andreafeletto.com>
pkgname='lolclock-git'
_pkgname='lolclock'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Displays time in a human (and configurable) way.'
arch=('any')
url='https://github.com/andreafeletto/lolclock'
license=('MIT')
install=lolclock.install
source=('lolclock::git+https://github.com/andreafeletto/lolclock.git#branch=master')
md5sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
