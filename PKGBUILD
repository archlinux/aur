# Maintainer: ugjka <esesmu@protonmail.com>

_pkgname=dumb-mp3-streamer
pkgname="$_pkgname-git"
pkgver=20181130.60d4a9c
pkgrel=1
pkgdesc='Stream mp3 from stdin'
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
