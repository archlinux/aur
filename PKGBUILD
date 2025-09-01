# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-providerlist
pkgver=1.0.0
pkgrel=17
pkgdesc='providerlist provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-providerlist')
provides=('elephant-providerlist')
source=("${url}/archive/refs/tags/v${pkgver}-beta-17.tar.gz")
sha256sums=('233f84f382e9c35b4bc5fb0b4cd7134a7511db14d76e3295d51fee2b5d5b3563')

build() {
    cd elephant-${pkgver}-beta-17/internal/providers/providerlist
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-17/internal/providers/providerlist
    install -Dm 755 providerlist.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
