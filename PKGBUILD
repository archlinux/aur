# Maintainer: Luke Arms <luke@arms.to>

pkgname=highlight-pointer
pkgver=1.1.3
pkgrel=1
pkgdesc="Highlight mouse pointer/cursor using a dot - useful for presentations, screen sharing"
arch=('x86_64')
url="https://github.com/swillner/highlight-pointer"
license=('MIT')
depends=('libx11' 'libxext' 'libxfixes' 'libxi')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a2f9752735e32150143d42d5e4b590a9941ceacdb6954b871e9129bfc07ebf49')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 highlight-pointer "$pkgdir/usr/bin/highlight-pointer"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
