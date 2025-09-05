# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=1.0.0
pkgrel=22
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}-beta-22.tar.gz")
sha256sums=('7d8c8628878d8170211544ed4b5e7880fe8267d5e2e7f509d1e1fe37f45fca01')

build() {
    cd ${pkgname}-${pkgver}-beta-22/cmd
    go build -buildvcs=false -x -o elephant -trimpath
}

package() {
    cd ${pkgname}-${pkgver}-beta-22/cmd
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # cd ../
    # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
