# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=random-access-kjv
pkgdesc="Access Random KJV Bible location for reading. from local server in browser or from command line"
pkgver=v1.0.0
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/random-access-kjv"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+https://github.com/pumenis/random-access-kjv.git#tag=v1.0.0")
sha256sums=('835b98ab4d3e1a4b6ac54d55715df28cb7624458ad48679f88c7b248bd479339')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags
}

build() {
    cd "$srcdir/$pkgname"
    go build -o build/random-access-kjv ./
    go build -o build/randfromkjv ./randfromkjv/
}

package() {
    cd "$srcdir/$pkgname"
    install -d ${pkgdir}/usr/bin
    cp build/* ${pkgdir}/usr/bin/
}
