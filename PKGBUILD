# Maintainer: Peter PJT (pjtsearch) <peterpjtsearch at gmail dot com>

pkgname=rptable-git
pkgver=v1.0.0.r0.g0e7284a
pkgrel=1
pkgdesc="A simple periodic table viewer for GTK written in Rust"
arch=('x86_64')
url="https://github.com/pjtsearch/rptable"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'rust')
options=('!strip')
provides=("rptable")
_pkgname="rptable"
source=("git+https://github.com/pjtsearch/rptable")

md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "${_pkgname}"
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="$pkgdir/" install
}
