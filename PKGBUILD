# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-providerlist
pkgver=1.0.0
pkgrel=19
pkgdesc='providerlist provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-providerlist')
provides=('elephant-providerlist')
source=("${url}/archive/refs/tags/v${pkgver}-beta-19.tar.gz")
sha256sums=('29c2c66c935aa9395b13e3f67cf325b8c4133af23793e862a7430d0b7acb0f07')

build() {
    cd elephant-${pkgver}-beta-19/internal/providers/providerlist
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-19/internal/providers/providerlist
    install -Dm 755 providerlist.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
