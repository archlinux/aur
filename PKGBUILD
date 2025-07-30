# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=0.1.1
pkgrel=1
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b095205133a077943287b7a6498f31cfadf0040c4a70177adb5a551c9acbae2f')

build() {
    cd ${pkgname}-${pkgver}/cmd
    go build -buildvcs=false -x -o elephant -trimpath
}

package() {
    cd ${pkgname}-${pkgver}/cmd
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # cd ../
    # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
