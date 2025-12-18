# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=random-access-ogb
pkgdesc="Access Random Old Georgian Bible location for reading. from local server in browser or from command line"
pkgver=v1.1.0
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/random-access-ogb"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+https://github.com/pumenis/random-access-ogb.git#tag=v1.1.0")
sha256sums=('bc93fdbb603b6d72340099a0fde891c07c6ec763091b457a3ae0cd737481280a')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags
}

build() {
    cd "$srcdir/$pkgname"
    go build -o build/random-access-ogb ./
    go build -o build/randfromogb ./randfromogb/
}

package() {
    cd "$srcdir/$pkgname"
    install -d ${pkgdir}/usr/bin
    cp build/* ${pkgdir}/usr/bin/
}
