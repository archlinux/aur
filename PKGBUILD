# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=1.0.0
pkgrel=14
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}-beta-14.tar.gz")
sha256sums=('efb24798315be38df2a20a6a9ebd516f627fcb45a755b37cc71bf258fe06e929')

build() {
    cd ${pkgname}-${pkgver}-beta-14/cmd
    go build -buildvcs=false -x -o elephant -trimpath
}

package() {
    cd ${pkgname}-${pkgver}-beta-14/cmd
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # cd ../
    # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
