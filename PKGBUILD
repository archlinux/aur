# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>

_pkgname=console-clock
pkgname=${_pkgname}-git
pkgver=r10.8d3784b
pkgver() {
    cd "$srcdir/console-clock"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Print system time periodically"
arch=(x86_64)
url="https://codeberg.org/dimich/${_pkgname}"
license=(GPL-3.0-or-later)
source=(git+"${url}")
sha256sums=('SKIP')

build() {
  make -C "${_pkgname}"
}

package() {
  make -C "${_pkgname}" DESTDIR="${pkgdir}" install
}
