# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=pokeshell-git
pkgver=r42.40026ce
pkgrel=1
pkgdesc="A shell program to show pokemon sprites in the terminal."
arch=('any')
url='https://github.com/acxz/pokeshell'
license=('GPLv3')
depends=('curl' 'jq' 'imagemagick' 'timg')
makedepends=()
provides=('pokeshell')
conflicts=('pokeshell')
_pkgname=pokeshell
source=("${_pkgname}::git+https://github.com/acxz/pokeshell")
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
    cp -v pokeshell ${pkgdir}/usr/bin

    mkdir -p ${pkgdir}/usr/share/bash-completion/completions
    cp -v pokeshell-completion.bash ${pkgdir}/usr/share/bash-completion/completions/pokeshell

    mkdir -p ${pkgdir}/usr/share/zsh/site-functions
    cp -v pokeshell-completion.bash ${pkgdir}/usr/share/zsh/site-functions/_pokeshell
}
