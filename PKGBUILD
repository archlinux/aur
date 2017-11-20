# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

pkgname=yanshi-git
_pkgname=yanshi
pkgver=0.57.9d86e63
pkgrel=1
pkgdesc='A regular language recognizer generater like Ragel, enhanced with features to approximate context-free grammars and substring grammars'
arch=('x86_64')
license=('Custom')
url="https://github.com/chaitin/yanshi"
makedepends=('git' 'make' 'gcc')
depends=('glibc' 'icu')
provides=('yanshi')
source=("git+https://github.com/chaitin/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

check() {
    cd ${_pkgname}
    # make unittest
}

build() {
    cd ${_pkgname}
    make build=release
}

package() {
    cd ${_pkgname}
    install -Dm755 release/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
