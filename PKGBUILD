# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=ankor
pkgdesc="application runner"
pkgver=v0.0.4
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/ankor"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+https://github.com/pumenis/ankor.git#tag=v0.0.4")
sha256sums=('298eca1399305283a310acdbc81f0c126f38f8b7a68f8f218b204b09784e4206')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags
}

build() {
    cd "$srcdir/$pkgname"
    go build -o build/ankor ./
}

package() {
    cd "$srcdir/$pkgname"
    install -d ${pkgdir}/usr/bin
    cp build/* ${pkgdir}/usr/bin/
}
