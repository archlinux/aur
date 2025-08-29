# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-symbols
pkgver=1.0.0
pkgrel=9
pkgdesc='symbols provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-symbols')
provides=('elephant-symbols')
source=("${url}/archive/refs/tags/v${pkgver}-beta-9.tar.gz")
sha256sums=('fccc09ea476594ff93c4981a0b4ec85c5ee1498b7ec079d7d83be60398dd30b2')

build() {
    cd elephant-${pkgver}-beta-9/internal/providers/symbols
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-9/internal/providers/symbols
    install -Dm 755 symbols.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
