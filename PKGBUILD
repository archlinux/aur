# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=1.0.0
pkgrel=12
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}-beta-12.tar.gz")
sha256sums=('5f64e8cc6d76986acfee595a7a38edf858ccc89dc21032faa117e4ee53b49422')

build() {
    cd ${pkgname}-${pkgver}-beta-12/cmd
    go build -buildvcs=false -x -o elephant -trimpath
}

package() {
    cd ${pkgname}-${pkgver}-beta-12/cmd
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # cd ../
    # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
