# Maintainer: Dominik Stanisław Suchora <hexderm@gmail.com>

pkgname='reliq'
pkgver=2.11.5fde003
pkgrel=1
pkgdesc='html parsing and searching tool'
arch=('any')
url='https://github.com/TUVIMEN/reliq'
license=('GPL-3.0-or-later')
provides=('reliq')
source=('git+https://github.com/TUVIMEN/reliq')
sha256sums=('SKIP')
makedepends=('git')

prepare() {
    cd "${pkgname}"

    git checkout -q 5fde0037c940684b440efd30dcc489e7aa523bed
}

build() {
    cd "${pkgname}"

    make
}

package(){
    cd "${pkgname}"

    make install PREFIX="${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
