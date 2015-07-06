# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=fiche-git
pkgver=r40.ga7174e1
pkgrel=1
pkgdesc="Command line pastebin for sharing terminal output (git version)"
arch=('i686' 'x86_64')
url="https://github.com/solusipse/fiche"
license=('MIT')
makedepends=('git')
source=("${pkgname}::git+https://github.com/solusipse/fiche")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    install -Dm755 fiche "${pkgdir}/usr/bin/fiche"
}
