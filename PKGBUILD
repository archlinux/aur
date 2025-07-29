# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant
pkgver=0.1.0
pkgrel=1
pkgdesc='general purpose datasource and executor'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant')
provides=('elephant')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('480839a4fa06df8c7c34bc91d7804da7c604b64abf5c531f7067f93dcedd7ce4')

build() {
    cd ${pkgname}-${pkgver}/cmd
    go build -x -o elephant
}

package() {
    cd ${pkgname}-${pkgver}/cmd
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # cd ../
    # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
