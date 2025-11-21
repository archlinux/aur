# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=2.16.1
pkgrel=1
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2fcf0ce5e060f304a6a175a4528feef05b417238baae31cce9966be495784b1a')

build() {
    cd ${pkgname}-${pkgver}/cmd/elephant
    go build -buildvcs=false -x -o elephant -trimpath
}

package() {
    cd ${pkgname}-${pkgver}/cmd/elephant
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    cd ../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
