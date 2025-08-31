# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-providerlist
pkgver=1.0.0
pkgrel=12
pkgdesc='providerlist provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-providerlist')
provides=('elephant-providerlist')
source=("${url}/archive/refs/tags/v${pkgver}-beta-12.tar.gz")
sha256sums=('5f64e8cc6d76986acfee595a7a38edf858ccc89dc21032faa117e4ee53b49422')

build() {
    cd elephant-${pkgver}-beta-12/internal/providers/providerlist
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-12/internal/providers/providerlist
    install -Dm 755 providerlist.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
