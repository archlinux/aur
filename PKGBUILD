# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Owen D'Aprile <aur@owen.sh>

pkgname=utf8info-git
pkgver=r39.0cf38fa
pkgrel=1
pkgdesc='Small utility that reads a UTF-8 stream and prints out the raw codepoint information.'
arch=('any')
url=https://github.com/lunasorcery/utf8info
license=('unknown')
makedepends=('curl' 'git' 'unzip')
source=("${pkgname}"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    make --directory="${pkgname}" --jobs=1
}

package() {
    install -Dm755 "${pkgname}/bin/utf8info" "${pkgdir}/usr/bin/utf8info"
}
