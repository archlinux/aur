# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname='concourse-fly-git'
pkgver=1
pkgrel=1
pkgdesc="Command line interface to the Concourse continuous integration tool"
arch=(i686 x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
makedepends=('go')
source=(git://github.com/concourse/concourse.git)
md5sums=(SKIP)

build() {
    cd concourse
    export GOPATH="$PWD"
    git submodule update --init --recursive
    cd src/github.com/concourse/fly
    go build
}

package() {
    cd concourse
    mkdir -p "$pkgdir/usr/bin"
    cp "src/github.com/concourse/fly/fly" "$pkgdir/usr/bin"
}
