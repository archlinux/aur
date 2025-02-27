# Maintainer: Dominik Stanisław Suchora <suchora.dominik7@gmail.com>

pkgname='reliq'
pkgver=2.8.04bebfa
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

    git revert --no-commit 04bebfa0ab48157c11f93695e79a039e50ad32cf
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
