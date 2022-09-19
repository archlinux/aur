# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=wallshell-git
pkgver=r6.aad7faf
pkgrel=1
pkgdesc="A shell program to fetch images in the terminal."
arch=('any')
url='https://github.com/acxz/wallshell'
license=('GPLv3')
depends=('curl' 'jq' 'imagemagick' 'chafa')
makedepends=('git')
provides=('wallshell')
conflicts=('wallshell')
_pkgname=wallshell
source=("${_pkgname}::git+https://github.com/acxz/wallshell")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    msg "Nothing to build"
}

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p ${pkgdir}/usr/bin
    cp -v bin/wallshell ${pkgdir}/usr/bin
}
