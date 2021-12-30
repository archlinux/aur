# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=autorandr-launcher-git
pkgver=0
pkgrel=1
pkgdesc="Listens to X server screen change events and launches autorandr after an event occurs."
arch=(any)
url="https://github.com/phillipberndt/autorandr"
license=(GPL3)
depends=(autorandr)
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install_launcher
}
