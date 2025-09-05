# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=1.0.0
pkgrel=21
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}-beta-21.tar.gz")
sha256sums=('0f144476574350e1fe48e0ae7368cdb03f658567d791b4d7f601f20815f8b4e9')

build() {
    cd ${pkgname}-${pkgver}-beta-21/cmd
    go build -buildvcs=false -x -o elephant -trimpath
}

package() {
    cd ${pkgname}-${pkgver}-beta-21/cmd
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # cd ../
    # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
