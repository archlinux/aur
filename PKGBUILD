# Maintainer: Dominik Stanisław Suchora <hexderm@gmail.com>

pkgname='reliq'
pkgver=2.10.2a45707
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

    git checkout -q 2a45707089ff56c4db073ff064bca3ffc17817a4
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
