# Maintainer: desbma
pkgname=bat-extras-git
pkgver=r71.8339354
pkgrel=1
pkgdesc='Bash scripts that integrate bat with various command line tools'
arch=('any')
_gitname='bat-extras'
url="https://github.com/eth-p/${_gitname}"
license=('MIT')
depends=('bat')
optdepends=('ripgrep: for batgrep script')
source=("git+https://github.com/eth-p/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    ./build.sh --minify=none
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/*
}
