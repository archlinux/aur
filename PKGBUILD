# Maintainer: Luke Arms <luke@arms.to>

pkgname=highlight-pointer
pkgver=1.2
pkgrel=1
pkgdesc="Highlight mouse pointer/cursor using a dot - useful for presentations, screen sharing"
arch=('x86_64')
url="https://github.com/swillner/highlight-pointer"
license=('MIT')
depends=('libx11' 'libxext' 'libxfixes' 'libxi')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('225976f4aea6441ca01442aeeac1bdeea4c8999b7032b77654e9216b9f18cf4c')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 highlight-pointer "$pkgdir/usr/bin/highlight-pointer"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
