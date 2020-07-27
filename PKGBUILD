# cstatus

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=cstatus-git
_pkgname=${pkgname%-*}
pkgver=0.0.2.r0.g9827a2c
pkgrel=3
pkgdesc='Minimal statusbar for dwm written in c99.'
arch=('x86_64')
url='https://github.com/andreafeletto/cstatus'
license=('MIT')
depends=('xorg-xsetroot' 'pulsemixer')
provides=('cstatus')
conflicts=('cstatus')
source=("git+https://github.com/andreafeletto/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
}
