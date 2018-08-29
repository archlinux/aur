# Maintainer: ugjka <esesmu@protonmail.com>

_pkgname=zipper
pkgname="$_pkgname-git"
pkgver=20180303.a0490e9
pkgrel=1
pkgdesc='Zipper zips directories'
arch=('x86_64')
url="https://github.com/ugjka/${_pkgname}"
license=('MIT')
makedepends=('go' 'go-tools' 'git' 'make')
source=("$_pkgname"::"git+http://github.com/ugjka/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}
build(){
    cd $_pkgname
    make prefix=/usr all
}

package(){
    cd $_pkgname
    make prefix="${pkgdir}"/usr install
    make clean
}
