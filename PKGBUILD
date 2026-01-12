# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=gowebgtkit
pkgdesc="Ankor applications Gui written in go"
pkgver=v0.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/pumenis/gowebgtkit"
license=('MIT')
depends=()
makedepends=('git' 'go' 'zenity')
source=("git+https://github.com/pumenis/gowebgtkit.git#tag=v0.0.1")
sha256sums=('f6f05752805254500e740151b9b6e5525ee5ab79a2c3c3a397aba2d03e60b96c')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags
}

build() {
    cd "$srcdir/$pkgname"
    go build -o build/gowebgtkit ./
}

package() {
    cd "$srcdir/$pkgname"
    install -d ${pkgdir}/usr/bin
    cp build/* ${pkgdir}/usr/bin/
}
