# lolclock

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=lolclock-git
_pkgname=${pkgname%-*}
pkgver=r13.e75305e
pkgrel=1
pkgdesc='Displays time in a human (and configurable) way.'
arch=('any')
url='https://github.com/andreafeletto/lolclock'
license=('MIT')
source=("git+https://github.com/andreafeletto/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
	printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
}
