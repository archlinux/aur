# Maintainer: Dominik Stanisław Suchora <suchora.dominik7@gmail.com>

pkgname='reliq'
pkgver=2.7.9b2ee74
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

    git revert --no-commit 9b2ee7439ee66a1ba71a47aadfa933f5f955be3c
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
