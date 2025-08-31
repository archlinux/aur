# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-files
pkgver=1.0.0
pkgrel=12
pkgdesc='files provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('fd')
makedepends=('go')
conflicts=('elephant-files')
provides=('elephant-files')
source=("${url}/archive/refs/tags/v${pkgver}-beta-12.tar.gz")
sha256sums=('5f64e8cc6d76986acfee595a7a38edf858ccc89dc21032faa117e4ee53b49422')

build() {
    cd elephant-${pkgver}-beta-12/internal/providers/files
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-12/internal/providers/files
    install -Dm 755 files.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
