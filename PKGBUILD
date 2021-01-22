# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=rime-dict-yangshann-git
pkgver=0.0.0.2c1b744
pkgrel=1
pkgdesc="A dictionary for rime"
arch=('any')
url="https://github.com/yangshann/rime-dict"
license=('GPL3')
makedepends=('git')
source=(
    "rime-dict::git+${url}.git"
)
sha512sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}"/rime-dict
    printf "%s" "0.0.0.$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}"/rime-dict
    install -Dm644 *.yaml -t "${pkgdir}"/usr/share/rime-data/
}
