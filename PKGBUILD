# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-websearch
pkgver=1.0.0
pkgrel=12
pkgdesc='websearch provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-websearch')
provides=('elephant-websearch')
source=("${url}/archive/refs/tags/v${pkgver}-beta-12.tar.gz")
sha256sums=('5f64e8cc6d76986acfee595a7a38edf858ccc89dc21032faa117e4ee53b49422')

build() {
    cd elephant-${pkgver}-beta-12/internal/providers/websearch
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-12/internal/providers/websearch
    install -Dm 755 websearch.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
