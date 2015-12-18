# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=simpletimer
pkgname=simpletimer-git
pkgver=0.7.0.r0.g9e056ef
pkgrel=1
pkgdesc="A lightweight timer/stopwatch for running multiple timers at once"
arch=(any)
url="https://github.com/icasdri/simpletimer"
license=('MIT')
depends=('gtk3')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    cd "$srcdir/simpletimer"
    make DESTDIR="$pkgdir/usr" install
}
