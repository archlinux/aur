# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=ankor
pkgdesc="application runner"
pkgver=v0.0.3
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/ankor"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+https://github.com/pumenis/ankor.git#tag=v0.0.3")
sha256sums=('a7a8f4d01d98920591ecbd141081e0ac2d9d9e6ac67b07d8960857270fd9b577')

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
