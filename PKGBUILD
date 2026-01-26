# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=ankor
pkgdesc="application runner"
pkgver=v0.0.2
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/ankor"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+https://github.com/pumenis/ankor.git#tag=v0.0.2")
sha256sums=('737e2cd87e2516b6856dfc7b1a1530ed5e4e03e9cfb2e550d023075ed934bbae')

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
