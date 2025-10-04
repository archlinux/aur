# Maintainer: Dominik Stanisław Suchora <hexderm@gmail.com>

pkgname='reliq'
pkgver=2.11.a1c8f62
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

    git checkout -q a1c8f62dc3f120c6d8968bb5563984de387302c3
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
