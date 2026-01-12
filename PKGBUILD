# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=ankor
pkgdesc="application runner"
pkgver=v0.0.1
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/ankor"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+https://github.com/pumenis/ankor.git#tag=v0.0.1")
sha256sums=('99439f9fa9ceffdb5bdd2b17cedcd63e6b1597cd5a9439d435635834eeee7296')

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
