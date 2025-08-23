# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-symbols
pkgver=1.0.0
pkgrel=4
pkgdesc='symbols provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-symbols')
provides=('elephant-symbols')
source=("${url}/archive/refs/tags/v${pkgver}-beta-4.tar.gz")
sha256sums=('20529c42d90448496533d408c6ed09ba93221b7badf61ade8859ff033a75830f')

build() {
    cd elephant-${pkgver}-beta-4/internal/providers/symbols
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-4/internal/providers/symbols
    install -Dm 755 symbols.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
